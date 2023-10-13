module TD.Query.ToggleGroupCallIsMyVideoPaused(ToggleGroupCallIsMyVideoPaused(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ToggleGroupCallIsMyVideoPaused -- ^ Toggles whether current user's video is paused
  = ToggleGroupCallIsMyVideoPaused
    { group_call_id      :: Maybe Int  -- ^ Group call identifier
    , is_my_video_paused :: Maybe Bool -- ^ Pass true if the current user's video is paused
    }
  deriving (Eq)

instance Show ToggleGroupCallIsMyVideoPaused where
  show
    ToggleGroupCallIsMyVideoPaused
      { group_call_id      = group_call_id_
      , is_my_video_paused = is_my_video_paused_
      }
        = "ToggleGroupCallIsMyVideoPaused"
          ++ I.cc
          [ "group_call_id"      `I.p` group_call_id_
          , "is_my_video_paused" `I.p` is_my_video_paused_
          ]

instance AT.ToJSON ToggleGroupCallIsMyVideoPaused where
  toJSON
    ToggleGroupCallIsMyVideoPaused
      { group_call_id      = group_call_id_
      , is_my_video_paused = is_my_video_paused_
      }
        = A.object
          [ "@type"              A..= AT.String "toggleGroupCallIsMyVideoPaused"
          , "group_call_id"      A..= group_call_id_
          , "is_my_video_paused" A..= is_my_video_paused_
          ]
