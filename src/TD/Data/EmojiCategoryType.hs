{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.EmojiCategoryType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes type of an emoji category
data EmojiCategoryType
  = -- | The category must be used by default
    EmojiCategoryTypeDefault
  | -- | The category must be used for emoji status selection
    EmojiCategoryTypeEmojiStatus
  | -- | The category must be used for chat photo emoji selection
    EmojiCategoryTypeChatPhoto
  deriving (Eq)

instance Show EmojiCategoryType where
  show EmojiCategoryTypeDefault =
    "EmojiCategoryTypeDefault"
      ++ U.cc
        []
  show EmojiCategoryTypeEmojiStatus =
    "EmojiCategoryTypeEmojiStatus"
      ++ U.cc
        []
  show EmojiCategoryTypeChatPhoto =
    "EmojiCategoryTypeChatPhoto"
      ++ U.cc
        []

instance T.FromJSON EmojiCategoryType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "emojiCategoryTypeDefault" -> parseEmojiCategoryTypeDefault v
      "emojiCategoryTypeEmojiStatus" -> parseEmojiCategoryTypeEmojiStatus v
      "emojiCategoryTypeChatPhoto" -> parseEmojiCategoryTypeChatPhoto v
      _ -> mempty
    where
      parseEmojiCategoryTypeDefault :: A.Value -> T.Parser EmojiCategoryType
      parseEmojiCategoryTypeDefault = A.withObject "EmojiCategoryTypeDefault" $ \_ -> return EmojiCategoryTypeDefault

      parseEmojiCategoryTypeEmojiStatus :: A.Value -> T.Parser EmojiCategoryType
      parseEmojiCategoryTypeEmojiStatus = A.withObject "EmojiCategoryTypeEmojiStatus" $ \_ -> return EmojiCategoryTypeEmojiStatus

      parseEmojiCategoryTypeChatPhoto :: A.Value -> T.Parser EmojiCategoryType
      parseEmojiCategoryTypeChatPhoto = A.withObject "EmojiCategoryTypeChatPhoto" $ \_ -> return EmojiCategoryTypeChatPhoto
  parseJSON _ = mempty

instance T.ToJSON EmojiCategoryType where
  toJSON EmojiCategoryTypeDefault =
    A.object
      [ "@type" A..= T.String "emojiCategoryTypeDefault"
      ]
  toJSON EmojiCategoryTypeEmojiStatus =
    A.object
      [ "@type" A..= T.String "emojiCategoryTypeEmojiStatus"
      ]
  toJSON EmojiCategoryTypeChatPhoto =
    A.object
      [ "@type" A..= T.String "emojiCategoryTypeChatPhoto"
      ]
