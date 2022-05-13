{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleGroupCallIsMyVideoEnabled where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether current user's video is enabled @group_call_id Group call identifier @is_my_video_enabled Pass true if the current user's video is enabled
data ToggleGroupCallIsMyVideoEnabled = ToggleGroupCallIsMyVideoEnabled
  { -- |
    is_my_video_enabled :: Maybe Bool,
    -- |
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleGroupCallIsMyVideoEnabled where
  show
    ToggleGroupCallIsMyVideoEnabled
      { is_my_video_enabled = is_my_video_enabled_,
        group_call_id = group_call_id_
      } =
      "ToggleGroupCallIsMyVideoEnabled"
        ++ U.cc
          [ U.p "is_my_video_enabled" is_my_video_enabled_,
            U.p "group_call_id" group_call_id_
          ]

instance T.ToJSON ToggleGroupCallIsMyVideoEnabled where
  toJSON
    ToggleGroupCallIsMyVideoEnabled
      { is_my_video_enabled = is_my_video_enabled_,
        group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleGroupCallIsMyVideoEnabled",
          "is_my_video_enabled" A..= is_my_video_enabled_,
          "group_call_id" A..= group_call_id_
        ]
