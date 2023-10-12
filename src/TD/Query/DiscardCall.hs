module TD.Query.DiscardCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data DiscardCall -- ^ Discards a call
  = DiscardCall
    { call_id         :: Maybe Int  -- ^ Call identifier
    , is_disconnected :: Maybe Bool -- ^ Pass true if the user was disconnected
    , duration        :: Maybe Int  -- ^ The call duration, in seconds
    , is_video        :: Maybe Bool -- ^ Pass true if the call was a video call
    , connection_id   :: Maybe Int  -- ^ Identifier of the connection used during the call
    }
  deriving (Eq)

instance Show DiscardCall where
  show
    DiscardCall
      { call_id         = call_id_
      , is_disconnected = is_disconnected_
      , duration        = duration_
      , is_video        = is_video_
      , connection_id   = connection_id_
      }
        = "DiscardCall"
          ++ I.cc
          [ "call_id"         `I.p` call_id_
          , "is_disconnected" `I.p` is_disconnected_
          , "duration"        `I.p` duration_
          , "is_video"        `I.p` is_video_
          , "connection_id"   `I.p` connection_id_
          ]

instance AT.ToJSON DiscardCall where
  toJSON
    DiscardCall
      { call_id         = call_id_
      , is_disconnected = is_disconnected_
      , duration        = duration_
      , is_video        = is_video_
      , connection_id   = connection_id_
      }
        = A.object
          [ "@type"           A..= AT.String "discardCall"
          , "call_id"         A..= call_id_
          , "is_disconnected" A..= is_disconnected_
          , "duration"        A..= duration_
          , "is_video"        A..= is_video_
          , "connection_id"   A..= I.toS connection_id_
          ]
