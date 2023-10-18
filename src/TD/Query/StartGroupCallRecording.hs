module TD.Query.StartGroupCallRecording
  (StartGroupCallRecording(..)
  , defaultStartGroupCallRecording
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Starts recording of an active group call. Requires groupCall.can_be_managed group call flag. Returns 'TD.Data.Ok.Ok'
data StartGroupCallRecording
  = StartGroupCallRecording
    { group_call_id            :: Maybe Int    -- ^ Group call identifier
    , title                    :: Maybe T.Text -- ^ Group call recording title; 0-64 characters
    , record_video             :: Maybe Bool   -- ^ Pass true to record a video file instead of an audio file
    , use_portrait_orientation :: Maybe Bool   -- ^ Pass true to use portrait orientation for video instead of landscape one
    }
  deriving (Eq, Show)

instance I.ShortShow StartGroupCallRecording where
  shortShow
    StartGroupCallRecording
      { group_call_id            = group_call_id_
      , title                    = title_
      , record_video             = record_video_
      , use_portrait_orientation = use_portrait_orientation_
      }
        = "StartGroupCallRecording"
          ++ I.cc
          [ "group_call_id"            `I.p` group_call_id_
          , "title"                    `I.p` title_
          , "record_video"             `I.p` record_video_
          , "use_portrait_orientation" `I.p` use_portrait_orientation_
          ]

instance AT.ToJSON StartGroupCallRecording where
  toJSON
    StartGroupCallRecording
      { group_call_id            = group_call_id_
      , title                    = title_
      , record_video             = record_video_
      , use_portrait_orientation = use_portrait_orientation_
      }
        = A.object
          [ "@type"                    A..= AT.String "startGroupCallRecording"
          , "group_call_id"            A..= group_call_id_
          , "title"                    A..= title_
          , "record_video"             A..= record_video_
          , "use_portrait_orientation" A..= use_portrait_orientation_
          ]

defaultStartGroupCallRecording :: StartGroupCallRecording
defaultStartGroupCallRecording =
  StartGroupCallRecording
    { group_call_id            = Nothing
    , title                    = Nothing
    , record_video             = Nothing
    , use_portrait_orientation = Nothing
    }

