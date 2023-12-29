module TD.Query.SetProfileAccentColor
  (SetProfileAccentColor(..)
  , defaultSetProfileAccentColor
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes accent color and background custom emoji for profile of the current user; for Telegram Premium users only. Returns 'TD.Data.Ok.Ok'
data SetProfileAccentColor
  = SetProfileAccentColor
    { profile_accent_color_id            :: Maybe Int -- ^ Identifier of the accent color to use for profile; pass -1 if none
    , profile_background_custom_emoji_id :: Maybe Int -- ^ Identifier of a custom emoji to be shown on the user's profile photo background; 0 if none
    }
  deriving (Eq, Show)

instance I.ShortShow SetProfileAccentColor where
  shortShow
    SetProfileAccentColor
      { profile_accent_color_id            = profile_accent_color_id_
      , profile_background_custom_emoji_id = profile_background_custom_emoji_id_
      }
        = "SetProfileAccentColor"
          ++ I.cc
          [ "profile_accent_color_id"            `I.p` profile_accent_color_id_
          , "profile_background_custom_emoji_id" `I.p` profile_background_custom_emoji_id_
          ]

instance AT.ToJSON SetProfileAccentColor where
  toJSON
    SetProfileAccentColor
      { profile_accent_color_id            = profile_accent_color_id_
      , profile_background_custom_emoji_id = profile_background_custom_emoji_id_
      }
        = A.object
          [ "@type"                              A..= AT.String "setProfileAccentColor"
          , "profile_accent_color_id"            A..= profile_accent_color_id_
          , "profile_background_custom_emoji_id" A..= fmap I.writeInt64  profile_background_custom_emoji_id_
          ]

defaultSetProfileAccentColor :: SetProfileAccentColor
defaultSetProfileAccentColor =
  SetProfileAccentColor
    { profile_accent_color_id            = Nothing
    , profile_background_custom_emoji_id = Nothing
    }

