module TD.Data.Call
  (Call(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.CallState as CallState

data Call
  = Call -- ^ Describes a call
    { _id           :: Maybe Int                 -- ^ Call identifier, not persistent
    , user_id       :: Maybe Int                 -- ^ User identifier of the other call participant
    , is_outgoing   :: Maybe Bool                -- ^ True, if the call is outgoing
    , is_video      :: Maybe Bool                -- ^ True, if the call is a video call
    , state         :: Maybe CallState.CallState -- ^ Call state
    , group_call_id :: Maybe Int                 -- ^ Identifier of the group call associated with the call; 0 if the group call isn't created yet. The group call can be received through the method getGroupCall
    }
  deriving (Eq, Show)

instance I.ShortShow Call where
  shortShow Call
    { _id           = _id_
    , user_id       = user_id_
    , is_outgoing   = is_outgoing_
    , is_video      = is_video_
    , state         = state_
    , group_call_id = group_call_id_
    }
      = "Call"
        ++ I.cc
        [ "_id"           `I.p` _id_
        , "user_id"       `I.p` user_id_
        , "is_outgoing"   `I.p` is_outgoing_
        , "is_video"      `I.p` is_video_
        , "state"         `I.p` state_
        , "group_call_id" `I.p` group_call_id_
        ]

instance AT.FromJSON Call where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "call" -> parseCall v
      _      -> mempty
    
    where
      parseCall :: A.Value -> AT.Parser Call
      parseCall = A.withObject "Call" $ \o -> do
        _id_           <- o A..:?  "id"
        user_id_       <- o A..:?  "user_id"
        is_outgoing_   <- o A..:?  "is_outgoing"
        is_video_      <- o A..:?  "is_video"
        state_         <- o A..:?  "state"
        group_call_id_ <- o A..:?  "group_call_id"
        pure $ Call
          { _id           = _id_
          , user_id       = user_id_
          , is_outgoing   = is_outgoing_
          , is_video      = is_video_
          , state         = state_
          , group_call_id = group_call_id_
          }
  parseJSON _ = mempty

