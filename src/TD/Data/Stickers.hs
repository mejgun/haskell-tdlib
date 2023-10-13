module TD.Data.Stickers
  ( Stickers(..)    
  , defaultStickers 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Sticker as Sticker

data Stickers
  = Stickers -- ^ Represents a list of stickers
    { stickers :: Maybe [Sticker.Sticker] -- ^ List of stickers
    }
  deriving (Eq)

instance Show Stickers where
  show Stickers
    { stickers = stickers_
    }
      = "Stickers"
        ++ I.cc
        [ "stickers" `I.p` stickers_
        ]

instance AT.FromJSON Stickers where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "stickers" -> parseStickers v
      _          -> mempty
    
    where
      parseStickers :: A.Value -> AT.Parser Stickers
      parseStickers = A.withObject "Stickers" $ \o -> do
        stickers_ <- o A..:?  "stickers"
        pure $ Stickers
          { stickers = stickers_
          }
  parseJSON _ = mempty

instance AT.ToJSON Stickers where
  toJSON Stickers
    { stickers = stickers_
    }
      = A.object
        [ "@type"    A..= AT.String "stickers"
        , "stickers" A..= stickers_
        ]

defaultStickers :: Stickers
defaultStickers =
  Stickers
    { stickers = Nothing
    }

