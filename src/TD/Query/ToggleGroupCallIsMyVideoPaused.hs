{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleGroupCallIsMyVideoPaused where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether current user's video is paused @group_call_id Group call identifier @is_my_video_paused Pass true if the current user's video is paused
data ToggleGroupCallIsMyVideoPaused = ToggleGroupCallIsMyVideoPaused
  { -- |
    is_my_video_paused :: Maybe Bool,
    -- |
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleGroupCallIsMyVideoPaused where
  show
    ToggleGroupCallIsMyVideoPaused
      { is_my_video_paused = is_my_video_paused_,
        group_call_id = group_call_id_
      } =
      "ToggleGroupCallIsMyVideoPaused"
        ++ U.cc
          [ U.p "is_my_video_paused" is_my_video_paused_,
            U.p "group_call_id" group_call_id_
          ]

instance T.ToJSON ToggleGroupCallIsMyVideoPaused where
  toJSON
    ToggleGroupCallIsMyVideoPaused
      { is_my_video_paused = is_my_video_paused_,
        group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleGroupCallIsMyVideoPaused",
          "is_my_video_paused" A..= is_my_video_paused_,
          "group_call_id" A..= group_call_id_
        ]
