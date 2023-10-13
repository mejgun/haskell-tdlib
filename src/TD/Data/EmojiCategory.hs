module TD.Data.EmojiCategory
  ( EmojiCategory(..)    
  , defaultEmojiCategory 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Sticker as Sticker

data EmojiCategory
  = EmojiCategory -- ^ Contains a list of similar emoji to search for in getStickers and searchStickers
    { name   :: Maybe T.Text          -- ^ Name of the category
    , icon   :: Maybe Sticker.Sticker -- ^ Custom emoji sticker, which represents icon of the category
    , emojis :: Maybe [T.Text]        -- ^ List of emojis in the category
    }
  deriving (Eq)

instance Show EmojiCategory where
  show EmojiCategory
    { name   = name_
    , icon   = icon_
    , emojis = emojis_
    }
      = "EmojiCategory"
        ++ I.cc
        [ "name"   `I.p` name_
        , "icon"   `I.p` icon_
        , "emojis" `I.p` emojis_
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
        name_   <- o A..:?  "name"
        icon_   <- o A..:?  "icon"
        emojis_ <- o A..:?  "emojis"
        pure $ EmojiCategory
          { name   = name_
          , icon   = icon_
          , emojis = emojis_
          }
  parseJSON _ = mempty

instance AT.ToJSON EmojiCategory where
  toJSON EmojiCategory
    { name   = name_
    , icon   = icon_
    , emojis = emojis_
    }
      = A.object
        [ "@type"  A..= AT.String "emojiCategory"
        , "name"   A..= name_
        , "icon"   A..= icon_
        , "emojis" A..= emojis_
        ]

defaultEmojiCategory :: EmojiCategory
defaultEmojiCategory =
  EmojiCategory
    { name   = Nothing
    , icon   = Nothing
    , emojis = Nothing
    }

