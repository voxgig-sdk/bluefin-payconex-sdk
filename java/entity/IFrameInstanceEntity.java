package voxgig.bluefinpayconexsdk.entity;

import java.util.LinkedHashMap;
import java.util.Map;

import voxgig.bluefinpayconexsdk.core.Context;
import voxgig.bluefinpayconexsdk.core.Entity;
import voxgig.bluefinpayconexsdk.core.Helpers;
import voxgig.bluefinpayconexsdk.core.SdkClient;
import voxgig.bluefinpayconexsdk.utility.struct.Struct;

/** IFrameInstance entity client for the BluefinPayconex SDK. */
@SuppressWarnings({"unchecked", "unused"})
public class IFrameInstanceEntity extends EntityBase {

  public IFrameInstanceEntity(SdkClient client, Map<String, Object> entopts) {
    super("i_frame_instance", client, entopts);
  }

  @Override
  public Entity make() {
    Map<String, Object> opts = new LinkedHashMap<>(this.entopts);
    return new IFrameInstanceEntity(this.client, opts);
  }


  @Override
  public Object load(Map<String, Object> reqmatch, Map<String, Object> ctrl) {
    Map<String, Object> ctxmap = new LinkedHashMap<>();
    ctxmap.put("opname", "load");
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
        if (ctx.result.resdata != null) {
          Map<String, Object> d = Helpers.toMapAny(Struct.clone(ctx.result.resdata));
          this.data = d == null ? new LinkedHashMap<>() : d;
        }
      }
    });
  }



  @Override
  public Object list(Map<String, Object> req, Map<String, Object> ctrl) {
    throw Helpers.unsupportedOp("list", this.name);
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
