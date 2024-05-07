module TD.Data.EmojiCategory
  (EmojiCategory(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.EmojiCategorySource as EmojiCategorySource

data EmojiCategory
  = EmojiCategory -- ^ Describes an emoji category
    { name        :: Maybe T.Text                                  -- ^ Name of the category
    , icon        :: Maybe Sticker.Sticker                         -- ^ Custom emoji sticker, which represents icon of the category
    , source      :: Maybe EmojiCategorySource.EmojiCategorySource -- ^ Source of stickers for the emoji category
    , is_greeting :: Maybe Bool                                    -- ^ True, if the category must be shown first when choosing a sticker for the start page
    }
  deriving (Eq, Show)

instance I.ShortShow EmojiCategory where
  shortShow EmojiCategory
    { name        = name_
    , icon        = icon_
    , source      = source_
    , is_greeting = is_greeting_
    }
      = "EmojiCategory"
        ++ I.cc
        [ "name"        `I.p` name_
        , "icon"        `I.p` icon_
        , "source"      `I.p` source_
        , "is_greeting" `I.p` is_greeting_
        ]

instance AT.FromJSON EmojiCategory where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojiCategory" -> parseEmojiCategory v
      _               -> mempty
    
    where
      parseEmojiCategory :: A.Value -> AT.Parser EmojiCategory
      parseEmojiCategory = A.withObject "EmojiCategory" $ \o -> do
        name_        <- o A..:?  "name"
        icon_        <- o A..:?  "icon"
        source_      <- o A..:?  "source"
        is_greeting_ <- o A..:?  "is_greeting"
        pure $ EmojiCategory
          { name        = name_
          , icon        = icon_
          , source      = source_
          , is_greeting = is_greeting_
          }
  parseJSON _ = mempty

