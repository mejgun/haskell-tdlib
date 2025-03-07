module TD.Query.CreateCall
  (CreateCall(..)
  , defaultCreateCall
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.CallProtocol as CallProtocol

-- | Creates a new call. Returns 'TD.Data.CallId.CallId'
data CreateCall
  = CreateCall
    { user_id       :: Maybe Int                       -- ^ Identifier of the user to be called
    , protocol      :: Maybe CallProtocol.CallProtocol -- ^ The call protocols supported by the application
    , is_video      :: Maybe Bool                      -- ^ Pass true to create a video call
    , group_call_id :: Maybe Int                       -- ^ Identifier of the group call to which the user will be added after exchanging private key via the call; pass 0 if none
    }
  deriving (Eq, Show)

instance I.ShortShow CreateCall where
  shortShow
    CreateCall
      { user_id       = user_id_
      , protocol      = protocol_
      , is_video      = is_video_
      , group_call_id = group_call_id_
      }
        = "CreateCall"
          ++ I.cc
          [ "user_id"       `I.p` user_id_
          , "protocol"      `I.p` protocol_
          , "is_video"      `I.p` is_video_
          , "group_call_id" `I.p` group_call_id_
          ]

instance AT.ToJSON CreateCall where
  toJSON
    CreateCall
      { user_id       = user_id_
      , protocol      = protocol_
      , is_video      = is_video_
      , group_call_id = group_call_id_
      }
        = A.object
          [ "@type"         A..= AT.String "createCall"
          , "user_id"       A..= user_id_
          , "protocol"      A..= protocol_
          , "is_video"      A..= is_video_
          , "group_call_id" A..= group_call_id_
          ]

defaultCreateCall :: CreateCall
defaultCreateCall =
  CreateCall
    { user_id       = Nothing
    , protocol      = Nothing
    , is_video      = Nothing
    , group_call_id = Nothing
    }

