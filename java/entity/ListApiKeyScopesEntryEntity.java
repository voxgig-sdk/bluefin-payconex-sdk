package voxgig.bluefinpayconexsdk.entity;

import java.util.LinkedHashMap;
import java.util.Map;

import voxgig.bluefinpayconexsdk.core.Context;
import voxgig.bluefinpayconexsdk.core.Entity;
import voxgig.bluefinpayconexsdk.core.Helpers;
import voxgig.bluefinpayconexsdk.core.SdkClient;
import voxgig.bluefinpayconexsdk.utility.struct.Struct;

/** ListApiKeyScopesEntry entity client for the BluefinPayconex SDK. */
@SuppressWarnings({"unchecked", "unused"})
public class ListApiKeyScopesEntryEntity extends EntityBase {

  public ListApiKeyScopesEntryEntity(SdkClient client, Map<String, Object> entopts) {
    super("list_api_key_scopes_entry", client, entopts);
  }

  @Override
  public Entity make() {
    Map<String, Object> opts = new LinkedHashMap<>(this.entopts);
    return new ListApiKeyScopesEntryEntity(this.client, opts);
  }

  @Override
  public Object load(Map<String, Object> req, Map<String, Object> ctrl) {
    throw Helpers.unsupportedOp("load", this.name);
  }



  @Override
  public Object list(Map<String, Object> reqmatch, Map<String, Object> ctrl) {
    Map<String, Object> ctxmap = new LinkedHashMap<>();
    ctxmap.put("opname", "list");
    ctxmap.put("ctrl", ctrl);
    ctxmap.put("match", this.match);
    ctxmap.put("data", this.data);
    ctxmap.put("reqmatch", reqmatch);
    Context ctx = this.utility.makeContext.apply(ctxmap, this.entctx);

    return runOp(ctx, () -> {
      if (ctx.result != null) {
        if (ctx.result.resmatch != null) {
          this.match = ctx.result.resmatch;
        }
      }
    });
  }



  @Override
  public Object create(Map<String, Object> req, Map<String, Object> ctrl) {
    throw Helpers.unsupportedOp("create", this.name);
  }


  @Override
  public Object update(Map<String, Object> req, Map<String, Object> ctrl) {
    throw Helpers.unsupportedOp("update", this.name);
  }


  @Override
  public Object remove(Map<String, Object> req, Map<String, Object> ctrl) {
    throw Helpers.unsupportedOp("remove", this.name);
  }

}
