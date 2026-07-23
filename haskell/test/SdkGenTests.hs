-- Generated model-driven entity + direct tests.
{-# LANGUAGE ScopedTypeVariables #-}

module SdkGenTests (genTests) where

import Control.Exception (SomeException, try)
import Data.IORef

import VoxgigStruct (Value (..), emptyMap, keysof, ismap, islist, isNoval, clone)
import SdkTypes
import SdkHelpers
import qualified SdkFeatures as F
import qualified SdkClient as C
import qualified TReadmeExamples
import Testutil
import TestJson (jsonRead)

-- Load an entity fixture (../.sdk/test/entity/<name>/<Name>TestData.json).
loadFixture :: String -> IO Value
loadFixture entName = do
  let lname = map toLowerCh entName
  raw <- readFile ("../.sdk/test/entity/" ++ lname ++ "/" ++ entName ++ "TestData.json")
  jsonRead raw
  where toLowerCh ch = if ch >= 'A' && ch <= 'Z' then toEnum (fromEnum ch + 32) else ch

-- The first new-ref data map for an entity (fixture.new.<entity>.<ref0>).
newRefData :: Value -> String -> IO Value
newRefData fixture entName = do
  newEnts <- getpathS fixture ("new." ++ entName)
  refs <- keysof newEnts
  case refs of
    [] -> emptyMap
    (r0 : _) -> do d <- getp newEnts r0; clone d

genTests :: Counters -> IO ()
genTests c = do
  TReadmeExamples.tests c
  account_updaterInstanceTest c
  account_updaterBasicTest c
  account_updaterDirectTest c
  account_updater_scheduleInstanceTest c
  account_updater_scheduleBasicTest c
  account_updater_scheduleDirectTest c
  account_updater_schedule_with_resultInstanceTest c
  account_updater_schedule_with_resultBasicTest c
  account_updater_schedule_with_resultDirectTest c
  account_updater_schedule_with_resultStreamTest c
  account_updater_subscription_with_resultInstanceTest c
  account_updater_subscription_with_resultBasicTest c
  account_updater_subscription_with_resultDirectTest c
  account_updater_updateInstanceTest c
  account_updater_updateBasicTest c
  account_updater_updateDirectTest c
  api_keyInstanceTest c
  api_keyBasicTest c
  api_keyDirectTest c
  api_keyStreamTest c
  apple_pay_merchant_detailInstanceTest c
  apple_pay_merchant_detailBasicTest c
  apple_pay_merchant_detailDirectTest c
  apple_pay_merchant_detailStreamTest c
  apple_pay_sessionInstanceTest c
  apple_pay_sessionBasicTest c
  apple_pay_sessionDirectTest c
  dynamic_descriptorInstanceTest c
  dynamic_descriptorBasicTest c
  dynamic_descriptorDirectTest c
  dynamic_descriptorStreamTest c
  i_frame_create_instanceInstanceTest c
  i_frame_create_instanceBasicTest c
  i_frame_create_instanceDirectTest c
  i_frame_instanceInstanceTest c
  i_frame_instanceBasicTest c
  i_frame_instanceDirectTest c
  iframeInstanceTest c
  iframeBasicTest c
  iframeDirectTest c
  iframeStreamTest c
  initInstanceTest c
  initBasicTest c
  initDirectTest c
  list_api_key_scopes_entryInstanceTest c
  list_api_key_scopes_entryBasicTest c
  list_api_key_scopes_entryDirectTest c
  list_api_key_scopes_entryStreamTest c
  payment_iframeInstanceTest c
  payment_iframeBasicTest c
  payment_iframeDirectTest c
  three_d_secure_authInstanceTest c
  three_d_secure_authBasicTest c
  three_d_secure_authDirectTest c
  three_d_secure_browser_initInstanceTest c
  three_d_secure_browser_initBasicTest c
  three_d_secure_browser_initDirectTest c
  three_d_secure_statusInstanceTest c
  three_d_secure_statusBasicTest c
  three_d_secure_statusDirectTest c
  transaction_detailInstanceTest c
  transaction_detailBasicTest c
  transaction_detailDirectTest c
  webhookInstanceTest c
  webhookBasicTest c
  webhookDirectTest c
  webhookStreamTest c

account_updaterInstanceTest :: Counters -> IO ()
account_updaterInstanceTest c = runTest c "account_updater.instance" $ do
  sdk <- C.testSdk0
  ent <- C.account_updater sdk VNoval
  pure (eName ent == "account_updater")

account_updaterBasicTest :: Counters -> IO ()
account_updaterBasicTest c = do
  fixture <- loadFixture "AccountUpdater"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  pure ()

account_updaterDirectTest :: Counters -> IO ()
account_updaterDirectTest c = runTest c "account_updater.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/account_updater/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

account_updater_scheduleInstanceTest :: Counters -> IO ()
account_updater_scheduleInstanceTest c = runTest c "account_updater_schedule.instance" $ do
  sdk <- C.testSdk0
  ent <- C.account_updater_schedule sdk VNoval
  pure (eName ent == "account_updater_schedule")

account_updater_scheduleBasicTest :: Counters -> IO ()
account_updater_scheduleBasicTest c = do
  fixture <- loadFixture "AccountUpdaterSchedule"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "account_updater_schedule.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.account_updater_schedule sdk VNoval
    d <- newRefData fixture "account_updater_schedule"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

account_updater_scheduleDirectTest :: Counters -> IO ()
account_updater_scheduleDirectTest c = runTest c "account_updater_schedule.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/account_updater_schedule/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

account_updater_schedule_with_resultInstanceTest :: Counters -> IO ()
account_updater_schedule_with_resultInstanceTest c = runTest c "account_updater_schedule_with_result.instance" $ do
  sdk <- C.testSdk0
  ent <- C.account_updater_schedule_with_result sdk VNoval
  pure (eName ent == "account_updater_schedule_with_result")

account_updater_schedule_with_resultBasicTest :: Counters -> IO ()
account_updater_schedule_with_resultBasicTest c = do
  fixture <- loadFixture "AccountUpdaterScheduleWithResult"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "account_updater_schedule_with_result.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.account_updater_schedule_with_result sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "account_updater_schedule_with_result.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.account_updater_schedule_with_result sdk VNoval
    d <- newRefData fixture "account_updater_schedule_with_result"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

account_updater_schedule_with_resultDirectTest :: Counters -> IO ()
account_updater_schedule_with_resultDirectTest c = runTest c "account_updater_schedule_with_result.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/account_updater_schedule_with_result/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

account_updater_schedule_with_resultStreamTest :: Counters -> IO ()
account_updater_schedule_with_resultStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("account_updater_schedule_with_result", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "account_updater_schedule_with_result.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.account_updater_schedule_with_result sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "account_updater_schedule_with_result.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.account_updater_schedule_with_result sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "account_updater_schedule_with_result.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.account_updater_schedule_with_result sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "account_updater_schedule_with_result.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.account_updater_schedule_with_result sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

account_updater_subscription_with_resultInstanceTest :: Counters -> IO ()
account_updater_subscription_with_resultInstanceTest c = runTest c "account_updater_subscription_with_result.instance" $ do
  sdk <- C.testSdk0
  ent <- C.account_updater_subscription_with_result sdk VNoval
  pure (eName ent == "account_updater_subscription_with_result")

account_updater_subscription_with_resultBasicTest :: Counters -> IO ()
account_updater_subscription_with_resultBasicTest c = do
  fixture <- loadFixture "AccountUpdaterSubscriptionWithResult"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "account_updater_subscription_with_result.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.account_updater_subscription_with_result sdk VNoval
    entmap <- getp existing "account_updater_subscription_with_result"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)
  runTest c "account_updater_subscription_with_result.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.account_updater_subscription_with_result sdk VNoval
    d <- newRefData fixture "account_updater_subscription_with_result"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))
  runTest c "account_updater_subscription_with_result.update" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.account_updater_subscription_with_result sdk VNoval
    d <- newRefData fixture "account_updater_subscription_with_result"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    upd <- jo [("id", cid), ("0", VStr "UpdatedMark")]
    ctrl2 <- emptyMap
    updated <- eUpdate ent upd ctrl2
    uv <- getp updated "0"
    pure (ismap updated && vstring uv == "UpdatedMark")

account_updater_subscription_with_resultDirectTest :: Counters -> IO ()
account_updater_subscription_with_resultDirectTest c = runTest c "account_updater_subscription_with_result.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/account_updater_subscription_with_result/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

account_updater_updateInstanceTest :: Counters -> IO ()
account_updater_updateInstanceTest c = runTest c "account_updater_update.instance" $ do
  sdk <- C.testSdk0
  ent <- C.account_updater_update sdk VNoval
  pure (eName ent == "account_updater_update")

account_updater_updateBasicTest :: Counters -> IO ()
account_updater_updateBasicTest c = do
  fixture <- loadFixture "AccountUpdaterUpdate"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "account_updater_update.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.account_updater_update sdk VNoval
    entmap <- getp existing "account_updater_update"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

account_updater_updateDirectTest :: Counters -> IO ()
account_updater_updateDirectTest c = runTest c "account_updater_update.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/account_updater_update/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

api_keyInstanceTest :: Counters -> IO ()
api_keyInstanceTest c = runTest c "api_key.instance" $ do
  sdk <- C.testSdk0
  ent <- C.api_key sdk VNoval
  pure (eName ent == "api_key")

api_keyBasicTest :: Counters -> IO ()
api_keyBasicTest c = do
  fixture <- loadFixture "ApiKey"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "api_key.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.api_key sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "api_key.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.api_key sdk VNoval
    entmap <- getp existing "api_key"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)
  runTest c "api_key.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.api_key sdk VNoval
    d <- newRefData fixture "api_key"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))
  runTest c "api_key.update" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.api_key sdk VNoval
    d <- newRefData fixture "api_key"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    upd <- jo [("id", cid), ("0", VStr "UpdatedMark")]
    ctrl2 <- emptyMap
    updated <- eUpdate ent upd ctrl2
    uv <- getp updated "0"
    pure (ismap updated && vstring uv == "UpdatedMark")
  runTest c "api_key.remove" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.api_key sdk VNoval
    d <- newRefData fixture "api_key"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    rm <- jo [("id", cid)]; ctrl2 <- emptyMap
    _ <- eRemove ent rm ctrl2
    pure True

api_keyDirectTest :: Counters -> IO ()
api_keyDirectTest c = runTest c "api_key.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/api_key/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

api_keyStreamTest :: Counters -> IO ()
api_keyStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("api_key", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "api_key.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.api_key sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "api_key.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.api_key sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "api_key.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.api_key sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "api_key.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.api_key sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

apple_pay_merchant_detailInstanceTest :: Counters -> IO ()
apple_pay_merchant_detailInstanceTest c = runTest c "apple_pay_merchant_detail.instance" $ do
  sdk <- C.testSdk0
  ent <- C.apple_pay_merchant_detail sdk VNoval
  pure (eName ent == "apple_pay_merchant_detail")

apple_pay_merchant_detailBasicTest :: Counters -> IO ()
apple_pay_merchant_detailBasicTest c = do
  fixture <- loadFixture "ApplePayMerchantDetail"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "apple_pay_merchant_detail.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.apple_pay_merchant_detail sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "apple_pay_merchant_detail.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.apple_pay_merchant_detail sdk VNoval
    d <- newRefData fixture "apple_pay_merchant_detail"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

apple_pay_merchant_detailDirectTest :: Counters -> IO ()
apple_pay_merchant_detailDirectTest c = runTest c "apple_pay_merchant_detail.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/apple_pay_merchant_detail/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

apple_pay_merchant_detailStreamTest :: Counters -> IO ()
apple_pay_merchant_detailStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("apple_pay_merchant_detail", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "apple_pay_merchant_detail.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.apple_pay_merchant_detail sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "apple_pay_merchant_detail.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.apple_pay_merchant_detail sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "apple_pay_merchant_detail.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.apple_pay_merchant_detail sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "apple_pay_merchant_detail.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.apple_pay_merchant_detail sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

apple_pay_sessionInstanceTest :: Counters -> IO ()
apple_pay_sessionInstanceTest c = runTest c "apple_pay_session.instance" $ do
  sdk <- C.testSdk0
  ent <- C.apple_pay_session sdk VNoval
  pure (eName ent == "apple_pay_session")

apple_pay_sessionBasicTest :: Counters -> IO ()
apple_pay_sessionBasicTest c = do
  fixture <- loadFixture "ApplePaySession"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "apple_pay_session.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.apple_pay_session sdk VNoval
    d <- newRefData fixture "apple_pay_session"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

apple_pay_sessionDirectTest :: Counters -> IO ()
apple_pay_sessionDirectTest c = runTest c "apple_pay_session.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/apple_pay_session/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

dynamic_descriptorInstanceTest :: Counters -> IO ()
dynamic_descriptorInstanceTest c = runTest c "dynamic_descriptor.instance" $ do
  sdk <- C.testSdk0
  ent <- C.dynamic_descriptor sdk VNoval
  pure (eName ent == "dynamic_descriptor")

dynamic_descriptorBasicTest :: Counters -> IO ()
dynamic_descriptorBasicTest c = do
  fixture <- loadFixture "DynamicDescriptor"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "dynamic_descriptor.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.dynamic_descriptor sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "dynamic_descriptor.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.dynamic_descriptor sdk VNoval
    entmap <- getp existing "dynamic_descriptor"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)
  runTest c "dynamic_descriptor.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.dynamic_descriptor sdk VNoval
    d <- newRefData fixture "dynamic_descriptor"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))
  runTest c "dynamic_descriptor.update" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.dynamic_descriptor sdk VNoval
    d <- newRefData fixture "dynamic_descriptor"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    upd <- jo [("id", cid), ("0", VStr "UpdatedMark")]
    ctrl2 <- emptyMap
    updated <- eUpdate ent upd ctrl2
    uv <- getp updated "0"
    pure (ismap updated && vstring uv == "UpdatedMark")
  runTest c "dynamic_descriptor.remove" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.dynamic_descriptor sdk VNoval
    d <- newRefData fixture "dynamic_descriptor"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    rm <- jo [("id", cid)]; ctrl2 <- emptyMap
    _ <- eRemove ent rm ctrl2
    pure True

dynamic_descriptorDirectTest :: Counters -> IO ()
dynamic_descriptorDirectTest c = runTest c "dynamic_descriptor.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/dynamic_descriptor/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

dynamic_descriptorStreamTest :: Counters -> IO ()
dynamic_descriptorStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("dynamic_descriptor", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "dynamic_descriptor.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.dynamic_descriptor sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "dynamic_descriptor.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.dynamic_descriptor sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "dynamic_descriptor.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.dynamic_descriptor sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "dynamic_descriptor.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.dynamic_descriptor sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

i_frame_create_instanceInstanceTest :: Counters -> IO ()
i_frame_create_instanceInstanceTest c = runTest c "i_frame_create_instance.instance" $ do
  sdk <- C.testSdk0
  ent <- C.i_frame_create_instance sdk VNoval
  pure (eName ent == "i_frame_create_instance")

i_frame_create_instanceBasicTest :: Counters -> IO ()
i_frame_create_instanceBasicTest c = do
  fixture <- loadFixture "IFrameCreateInstance"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "i_frame_create_instance.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.i_frame_create_instance sdk VNoval
    d <- newRefData fixture "i_frame_create_instance"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

i_frame_create_instanceDirectTest :: Counters -> IO ()
i_frame_create_instanceDirectTest c = runTest c "i_frame_create_instance.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/i_frame_create_instance/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

i_frame_instanceInstanceTest :: Counters -> IO ()
i_frame_instanceInstanceTest c = runTest c "i_frame_instance.instance" $ do
  sdk <- C.testSdk0
  ent <- C.i_frame_instance sdk VNoval
  pure (eName ent == "i_frame_instance")

i_frame_instanceBasicTest :: Counters -> IO ()
i_frame_instanceBasicTest c = do
  fixture <- loadFixture "IFrameInstance"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "i_frame_instance.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.i_frame_instance sdk VNoval
    entmap <- getp existing "i_frame_instance"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

i_frame_instanceDirectTest :: Counters -> IO ()
i_frame_instanceDirectTest c = runTest c "i_frame_instance.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/i_frame_instance/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

iframeInstanceTest :: Counters -> IO ()
iframeInstanceTest c = runTest c "iframe.instance" $ do
  sdk <- C.testSdk0
  ent <- C.iframe sdk VNoval
  pure (eName ent == "iframe")

iframeBasicTest :: Counters -> IO ()
iframeBasicTest c = do
  fixture <- loadFixture "Iframe"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "iframe.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.iframe sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "iframe.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.iframe sdk VNoval
    entmap <- getp existing "iframe"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)
  runTest c "iframe.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.iframe sdk VNoval
    d <- newRefData fixture "iframe"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))
  runTest c "iframe.update" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.iframe sdk VNoval
    d <- newRefData fixture "iframe"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    upd <- jo [("id", cid), ("0", VStr "UpdatedMark")]
    ctrl2 <- emptyMap
    updated <- eUpdate ent upd ctrl2
    uv <- getp updated "0"
    pure (ismap updated && vstring uv == "UpdatedMark")

iframeDirectTest :: Counters -> IO ()
iframeDirectTest c = runTest c "iframe.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/iframe/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

iframeStreamTest :: Counters -> IO ()
iframeStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("iframe", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "iframe.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.iframe sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "iframe.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.iframe sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "iframe.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.iframe sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "iframe.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.iframe sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

initInstanceTest :: Counters -> IO ()
initInstanceTest c = runTest c "init.instance" $ do
  sdk <- C.testSdk0
  ent <- C.init sdk VNoval
  pure (eName ent == "init")

initBasicTest :: Counters -> IO ()
initBasicTest c = do
  fixture <- loadFixture "Init"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "init.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.init sdk VNoval
    d <- newRefData fixture "init"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

initDirectTest :: Counters -> IO ()
initDirectTest c = runTest c "init.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/init/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

list_api_key_scopes_entryInstanceTest :: Counters -> IO ()
list_api_key_scopes_entryInstanceTest c = runTest c "list_api_key_scopes_entry.instance" $ do
  sdk <- C.testSdk0
  ent <- C.list_api_key_scopes_entry sdk VNoval
  pure (eName ent == "list_api_key_scopes_entry")

list_api_key_scopes_entryBasicTest :: Counters -> IO ()
list_api_key_scopes_entryBasicTest c = do
  fixture <- loadFixture "ListApiKeyScopesEntry"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "list_api_key_scopes_entry.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.list_api_key_scopes_entry sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)

list_api_key_scopes_entryDirectTest :: Counters -> IO ()
list_api_key_scopes_entryDirectTest c = runTest c "list_api_key_scopes_entry.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/list_api_key_scopes_entry/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

list_api_key_scopes_entryStreamTest :: Counters -> IO ()
list_api_key_scopes_entryStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("list_api_key_scopes_entry", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "list_api_key_scopes_entry.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.list_api_key_scopes_entry sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "list_api_key_scopes_entry.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.list_api_key_scopes_entry sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "list_api_key_scopes_entry.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.list_api_key_scopes_entry sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "list_api_key_scopes_entry.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.list_api_key_scopes_entry sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)

payment_iframeInstanceTest :: Counters -> IO ()
payment_iframeInstanceTest c = runTest c "payment_iframe.instance" $ do
  sdk <- C.testSdk0
  ent <- C.payment_iframe sdk VNoval
  pure (eName ent == "payment_iframe")

payment_iframeBasicTest :: Counters -> IO ()
payment_iframeBasicTest c = do
  fixture <- loadFixture "PaymentIframe"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  pure ()

payment_iframeDirectTest :: Counters -> IO ()
payment_iframeDirectTest c = runTest c "payment_iframe.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/payment_iframe/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

three_d_secure_authInstanceTest :: Counters -> IO ()
three_d_secure_authInstanceTest c = runTest c "three_d_secure_auth.instance" $ do
  sdk <- C.testSdk0
  ent <- C.three_d_secure_auth sdk VNoval
  pure (eName ent == "three_d_secure_auth")

three_d_secure_authBasicTest :: Counters -> IO ()
three_d_secure_authBasicTest c = do
  fixture <- loadFixture "ThreeDSecureAuth"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "three_d_secure_auth.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.three_d_secure_auth sdk VNoval
    d <- newRefData fixture "three_d_secure_auth"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

three_d_secure_authDirectTest :: Counters -> IO ()
three_d_secure_authDirectTest c = runTest c "three_d_secure_auth.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/three_d_secure_auth/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

three_d_secure_browser_initInstanceTest :: Counters -> IO ()
three_d_secure_browser_initInstanceTest c = runTest c "three_d_secure_browser_init.instance" $ do
  sdk <- C.testSdk0
  ent <- C.three_d_secure_browser_init sdk VNoval
  pure (eName ent == "three_d_secure_browser_init")

three_d_secure_browser_initBasicTest :: Counters -> IO ()
three_d_secure_browser_initBasicTest c = do
  fixture <- loadFixture "ThreeDSecureBrowserInit"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "three_d_secure_browser_init.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.three_d_secure_browser_init sdk VNoval
    d <- newRefData fixture "three_d_secure_browser_init"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))

three_d_secure_browser_initDirectTest :: Counters -> IO ()
three_d_secure_browser_initDirectTest c = runTest c "three_d_secure_browser_init.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/three_d_secure_browser_init/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

three_d_secure_statusInstanceTest :: Counters -> IO ()
three_d_secure_statusInstanceTest c = runTest c "three_d_secure_status.instance" $ do
  sdk <- C.testSdk0
  ent <- C.three_d_secure_status sdk VNoval
  pure (eName ent == "three_d_secure_status")

three_d_secure_statusBasicTest :: Counters -> IO ()
three_d_secure_statusBasicTest c = do
  fixture <- loadFixture "ThreeDSecureStatus"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "three_d_secure_status.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.three_d_secure_status sdk VNoval
    entmap <- getp existing "three_d_secure_status"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

three_d_secure_statusDirectTest :: Counters -> IO ()
three_d_secure_statusDirectTest c = runTest c "three_d_secure_status.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/three_d_secure_status/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

transaction_detailInstanceTest :: Counters -> IO ()
transaction_detailInstanceTest c = runTest c "transaction_detail.instance" $ do
  sdk <- C.testSdk0
  ent <- C.transaction_detail sdk VNoval
  pure (eName ent == "transaction_detail")

transaction_detailBasicTest :: Counters -> IO ()
transaction_detailBasicTest c = do
  fixture <- loadFixture "TransactionDetail"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "transaction_detail.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.transaction_detail sdk VNoval
    entmap <- getp existing "transaction_detail"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)

transaction_detailDirectTest :: Counters -> IO ()
transaction_detailDirectTest c = runTest c "transaction_detail.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/transaction_detail/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

webhookInstanceTest :: Counters -> IO ()
webhookInstanceTest c = runTest c "webhook.instance" $ do
  sdk <- C.testSdk0
  ent <- C.webhook sdk VNoval
  pure (eName ent == "webhook")

webhookBasicTest :: Counters -> IO ()
webhookBasicTest c = do
  fixture <- loadFixture "Webhook"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "webhook.list" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.webhook sdk VNoval
    em1 <- emptyMap; em2 <- emptyMap
    lst <- eList ent em1 em2
    pure (islist lst)
  runTest c "webhook.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.webhook sdk VNoval
    entmap <- getp existing "webhook"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        lid <- getp loaded "id"
        pure (ismap loaded && vstring lid == id0)
  runTest c "webhook.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.webhook sdk VNoval
    d <- newRefData fixture "webhook"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    pure (ismap created && not (isNoval cid))
  runTest c "webhook.update" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.webhook sdk VNoval
    d <- newRefData fixture "webhook"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    upd <- jo [("id", cid), ("0", VStr "UpdatedMark")]
    ctrl2 <- emptyMap
    updated <- eUpdate ent upd ctrl2
    uv <- getp updated "0"
    pure (ismap updated && vstring uv == "UpdatedMark")
  runTest c "webhook.remove" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.webhook sdk VNoval
    d <- newRefData fixture "webhook"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cid <- getp created "id"
    rm <- jo [("id", cid)]; ctrl2 <- emptyMap
    _ <- eRemove ent rm ctrl2
    pure True

webhookDirectTest :: Counters -> IO ()
webhookDirectTest c = runTest c "webhook.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/webhook/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)

webhookStreamTest :: Counters -> IO ()
webhookStreamTest c = do
  let mkSeed = do
        r1 <- jo [("id", VStr "S1"), ("name", VStr "a")]
        r2 <- jo [("id", VStr "S2"), ("name", VStr "b")]
        r3 <- jo [("id", VStr "S3"), ("name", VStr "c")]
        recs <- jo [("S1", r1), ("S2", r2), ("S3", r3)]
        jo [("webhook", recs)]
      hasStreaming = do
        sdk0 <- C.testSdk0
        fs <- getp (clConfig sdk0) "feature"
        st <- getp fs "streaming"
        pure (not (isNoval st))
  runTest c "webhook.stream" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.webhook sdk VNoval
    em1 <- emptyMap
    items <- eStream ent "list" em1 VNoval
    pure (length items == 3 && (case items of (x : _) -> ismap x; [] -> False))
  runTest c "webhook.stream_signal" $ do
    seed <- mkSeed; opts <- jo [("entity", seed)]
    sdk <- C.testSdk opts VNoval
    ent <- C.webhook sdk VNoval
    em1 <- emptyMap
    n <- newIORef (0 :: Int)
    let sig = vfunc0 (do modifyIORef n (+ 1); v <- readIORef n; pure (VBool (v >= 2)))
    co <- jo [("signal", sig)]
    items <- eStream ent "list" em1 co
    pure (length items == 1)
  runTest c "webhook.stream_active" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.webhook sdk VNoval
      em1 <- emptyMap
      items <- eStream ent "list" em1 VNoval
      pure (length items == 3)
  runTest c "webhook.stream_chunk" $ do
    hs <- hasStreaming
    if not hs then pure True else do
      seed <- mkSeed; opts <- jo [("entity", seed)]
      stg <- jo [("active", VBool True), ("chunkSize", VNum 2)]; strm <- jo [("streaming", stg)]; sopts <- jo [("feature", strm)]
      sdk <- C.testSdk opts sopts
      ent <- C.webhook sdk VNoval
      em1 <- emptyMap
      batches <- eStream ent "list" em1 VNoval
      pure (length batches == 2)
