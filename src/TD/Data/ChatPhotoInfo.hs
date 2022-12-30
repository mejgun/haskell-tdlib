{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatPhotoInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified Utils as U

-- |
data ChatPhotoInfo = -- | Contains basic information about the photo of a chat
  ChatPhotoInfo
  { -- | True, if the photo is visible only for the current user
    is_personal :: Maybe Bool,
    -- | True, if the photo has animated variant
    has_animation :: Maybe Bool,
    -- | Chat photo minithumbnail; may be null
    minithumbnail :: Maybe Minithumbnail.Minithumbnail,
    -- | A big (640x640) chat photo variant in JPEG format. The file can be downloaded only before the photo is changed
    big :: Maybe File.File,
    -- | A small (160x160) chat photo variant in JPEG format. The file can be downloaded only before the photo is changed
    small :: Maybe File.File
  }
  deriving (Eq)

instance Show ChatPhotoInfo where
  show
    ChatPhotoInfo
      { is_personal = is_personal_,
        has_animation = has_animation_,
        minithumbnail = minithumbnail_,
        big = big_,
        small = small_
      } =
      "ChatPhotoInfo"
        ++ U.cc
          [ U.p "is_personal" is_personal_,
            U.p "has_animation" has_animation_,
            U.p "minithumbnail" minithumbnail_,
            U.p "big" big_,
            U.p "small" small_
          ]

instance T.FromJSON ChatPhotoInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatPhotoInfo" -> parseChatPhotoInfo v
      _ -> mempty
    where
      parseChatPhotoInfo :: A.Value -> T.Parser ChatPhotoInfo
      parseChatPhotoInfo = A.withObject "ChatPhotoInfo" $ \o -> do
        is_personal_ <- o A..:? "is_personal"
        has_animation_ <- o A..:? "has_animation"
        minithumbnail_ <- o A..:? "minithumbnail"
        big_ <- o A..:? "big"
        small_ <- o A..:? "small"
        return $ ChatPhotoInfo {is_personal = is_personal_, has_animation = has_animation_, minithumbnail = minithumbnail_, big = big_, small = small_}
  parseJSON _ = mempty

instance T.ToJSON ChatPhotoInfo where
  toJSON
    ChatPhotoInfo
      { is_personal = is_personal_,
        has_animation = has_animation_,
        minithumbnail = minithumbnail_,
        big = big_,
        small = small_
      } =
      A.object
        [ "@type" A..= T.String "chatPhotoInfo",
          "is_personal" A..= is_personal_,
          "has_animation" A..= has_animation_,
          "minithumbnail" A..= minithumbnail_,
          "big" A..= big_,
          "small" A..= small_
        ]
