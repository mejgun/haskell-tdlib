module TD.Query.ToggleGroupCallIsMyVideoEnabled
  (ToggleGroupCallIsMyVideoEnabled(..)
  , defaultToggleGroupCallIsMyVideoEnabled
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether current user's video is enabled. Returns 'TD.Data.Ok.Ok'
data ToggleGroupCallIsMyVideoEnabled
  = ToggleGroupCallIsMyVideoEnabled
    { group_call_id       :: Maybe Int  -- ^ Group call identifier
    , is_my_video_enabled :: Maybe Bool -- ^ Pass true if the current user's video is enabled
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleGroupCallIsMyVideoEnabled where
  shortShow
    ToggleGroupCallIsMyVideoEnabled
      { group_call_id       = group_call_id_
      , is_my_video_enabled = is_my_video_enabled_
      }
        = "ToggleGroupCallIsMyVideoEnabled"
          ++ I.cc
          [ "group_call_id"       `I.p` group_call_id_
          , "is_my_video_enabled" `I.p` is_my_video_enabled_
          ]

instance AT.ToJSON ToggleGroupCallIsMyVideoEnabled where
  toJSON
    ToggleGroupCallIsMyVideoEnabled
      { group_call_id       = group_call_id_
      , is_my_video_enabled = is_my_video_enabled_
      }
        = A.object
          [ "@type"               A..= AT.String "toggleGroupCallIsMyVideoEnabled"
          , "group_call_id"       A..= group_call_id_
          , "is_my_video_enabled" A..= is_my_video_enabled_
          ]

defaultToggleGroupCallIsMyVideoEnabled :: ToggleGroupCallIsMyVideoEnabled
defaultToggleGroupCallIsMyVideoEnabled =
  ToggleGroupCallIsMyVideoEnabled
    { group_call_id       = Nothing
    , is_my_video_enabled = Nothing
    }

