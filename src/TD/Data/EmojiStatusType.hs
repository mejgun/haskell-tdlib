module TD.Data.EmojiStatusType
  (EmojiStatusType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.UpgradedGiftBackdropColors as UpgradedGiftBackdropColors

-- | Describes type of emoji status
data EmojiStatusType
  = EmojiStatusTypeCustomEmoji -- ^ A custom emoji set as emoji status
    { custom_emoji_id :: Maybe Int -- ^ Identifier of the custom emoji in stickerFormatTgs format
    }
  | EmojiStatusTypeUpgradedGift -- ^ An upgraded gift set as emoji status
    { upgraded_gift_id       :: Maybe Int                                                   -- ^ Identifier of the upgraded gift
    , gift_title             :: Maybe T.Text                                                -- ^ The title of the upgraded gift
    , gift_name              :: Maybe T.Text                                                -- ^ Unique name of the upgraded gift that can be used with internalLinkTypeUpgradedGift
    , model_custom_emoji_id  :: Maybe Int                                                   -- ^ Custom emoji identifier of the model of the upgraded gift
    , symbol_custom_emoji_id :: Maybe Int                                                   -- ^ Custom emoji identifier of the symbol of the upgraded gift
    , backdrop_colors        :: Maybe UpgradedGiftBackdropColors.UpgradedGiftBackdropColors -- ^ Colors of the backdrop of the upgraded gift
    }
  deriving (Eq, Show)

instance I.ShortShow EmojiStatusType where
  shortShow EmojiStatusTypeCustomEmoji
    { custom_emoji_id = custom_emoji_id_
    }
      = "EmojiStatusTypeCustomEmoji"
        ++ I.cc
        [ "custom_emoji_id" `I.p` custom_emoji_id_
        ]
  shortShow EmojiStatusTypeUpgradedGift
    { upgraded_gift_id       = upgraded_gift_id_
    , gift_title             = gift_title_
    , gift_name              = gift_name_
    , model_custom_emoji_id  = model_custom_emoji_id_
    , symbol_custom_emoji_id = symbol_custom_emoji_id_
    , backdrop_colors        = backdrop_colors_
    }
      = "EmojiStatusTypeUpgradedGift"
        ++ I.cc
        [ "upgraded_gift_id"       `I.p` upgraded_gift_id_
        , "gift_title"             `I.p` gift_title_
        , "gift_name"              `I.p` gift_name_
        , "model_custom_emoji_id"  `I.p` model_custom_emoji_id_
        , "symbol_custom_emoji_id" `I.p` symbol_custom_emoji_id_
        , "backdrop_colors"        `I.p` backdrop_colors_
        ]

instance AT.FromJSON EmojiStatusType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiStatusTypeCustomEmoji"  -> parseEmojiStatusTypeCustomEmoji v
      "emojiStatusTypeUpgradedGift" -> parseEmojiStatusTypeUpgradedGift v
      _                             -> mempty
    
    where
      parseEmojiStatusTypeCustomEmoji :: A.Value -> AT.Parser EmojiStatusType
      parseEmojiStatusTypeCustomEmoji = A.withObject "EmojiStatusTypeCustomEmoji" $ \o -> do
        custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "custom_emoji_id"
        pure $ EmojiStatusTypeCustomEmoji
          { custom_emoji_id = custom_emoji_id_
          }
      parseEmojiStatusTypeUpgradedGift :: A.Value -> AT.Parser EmojiStatusType
      parseEmojiStatusTypeUpgradedGift = A.withObject "EmojiStatusTypeUpgradedGift" $ \o -> do
        upgraded_gift_id_       <- fmap I.readInt64 <$> o A..:?  "upgraded_gift_id"
        gift_title_             <- o A..:?                       "gift_title"
        gift_name_              <- o A..:?                       "gift_name"
        model_custom_emoji_id_  <- fmap I.readInt64 <$> o A..:?  "model_custom_emoji_id"
        symbol_custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "symbol_custom_emoji_id"
        backdrop_colors_        <- o A..:?                       "backdrop_colors"
        pure $ EmojiStatusTypeUpgradedGift
          { upgraded_gift_id       = upgraded_gift_id_
          , gift_title             = gift_title_
          , gift_name              = gift_name_
          , model_custom_emoji_id  = model_custom_emoji_id_
          , symbol_custom_emoji_id = symbol_custom_emoji_id_
          , backdrop_colors        = backdrop_colors_
          }
  parseJSON _ = mempty

instance AT.ToJSON EmojiStatusType where
  toJSON EmojiStatusTypeCustomEmoji
    { custom_emoji_id = custom_emoji_id_
    }
      = A.object
        [ "@type"           A..= AT.String "emojiStatusTypeCustomEmoji"
        , "custom_emoji_id" A..= fmap I.writeInt64  custom_emoji_id_
        ]
  toJSON EmojiStatusTypeUpgradedGift
    { upgraded_gift_id       = upgraded_gift_id_
    , gift_title             = gift_title_
    , gift_name              = gift_name_
    , model_custom_emoji_id  = model_custom_emoji_id_
    , symbol_custom_emoji_id = symbol_custom_emoji_id_
    , backdrop_colors        = backdrop_colors_
    }
      = A.object
        [ "@type"                  A..= AT.String "emojiStatusTypeUpgradedGift"
        , "upgraded_gift_id"       A..= fmap I.writeInt64  upgraded_gift_id_
        , "gift_title"             A..= gift_title_
        , "gift_name"              A..= gift_name_
        , "model_custom_emoji_id"  A..= fmap I.writeInt64  model_custom_emoji_id_
        , "symbol_custom_emoji_id" A..= fmap I.writeInt64  symbol_custom_emoji_id_
        , "backdrop_colors"        A..= backdrop_colors_
        ]

