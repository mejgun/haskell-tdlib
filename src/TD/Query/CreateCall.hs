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
    { user_id  :: Maybe Int                       -- ^ Identifier of the user to be called
    , protocol :: Maybe CallProtocol.CallProtocol -- ^ The call protocols supported by the application
    , is_video :: Maybe Bool                      -- ^ Pass true to create a video call
    }
  deriving (Eq, Show)

instance I.ShortShow CreateCall where
  shortShow
    CreateCall
      { user_id  = user_id_
      , protocol = protocol_
      , is_video = is_video_
      }
        = "CreateCall"
          ++ I.cc
          [ "user_id"  `I.p` user_id_
          , "protocol" `I.p` protocol_
          , "is_video" `I.p` is_video_
          ]

instance AT.ToJSON CreateCall where
  toJSON
    CreateCall
      { user_id  = user_id_
      , protocol = protocol_
      , is_video = is_video_
      }
        = A.object
          [ "@type"    A..= AT.String "createCall"
          , "user_id"  A..= user_id_
          , "protocol" A..= protocol_
          , "is_video" A..= is_video_
          ]

defaultCreateCall :: CreateCall
defaultCreateCall =
  CreateCall
    { user_id  = Nothing
    , protocol = Nothing
    , is_video = Nothing
    }

