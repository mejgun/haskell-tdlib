{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Stickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Sticker as Sticker
import qualified Utils as U

data Stickers = -- | Represents a list of stickers @stickers List of stickers
  Stickers
  { -- |
    stickers :: Maybe [Sticker.Sticker]
  }
  deriving (Eq)

instance Show Stickers where
  show
    Stickers
      { stickers = stickers
      } =
      "Stickers"
        ++ U.cc
          [ U.p "stickers" stickers
          ]

instance T.FromJSON Stickers where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "stickers" -> parseStickers v
      _ -> fail ""
    where
      parseStickers :: A.Value -> T.Parser Stickers
      parseStickers = A.withObject "Stickers" $ \o -> do
        stickers_ <- o A..:? "stickers"
        return $ Stickers {stickers = stickers_}
  parseJSON _ = fail ""

instance T.ToJSON Stickers where
  toJSON
    Stickers
      { stickers = stickers
      } =
      A.object
        [ "@type" A..= T.String "stickers",
          "stickers" A..= stickers
        ]
