{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Emojis where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data Emojis = -- | Represents a list of emoji @emojis List of emojis
  Emojis
  { -- |
    emojis :: Maybe [String]
  }
  deriving (Eq)

instance Show Emojis where
  show
    Emojis
      { emojis = emojis_
      } =
      "Emojis"
        ++ U.cc
          [ U.p "emojis" emojis_
          ]

instance T.FromJSON Emojis where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "emojis" -> parseEmojis v
      _ -> mempty
    where
      parseEmojis :: A.Value -> T.Parser Emojis
      parseEmojis = A.withObject "Emojis" $ \o -> do
        emojis_ <- o A..:? "emojis"
        return $ Emojis {emojis = emojis_}
  parseJSON _ = mempty

instance T.ToJSON Emojis where
  toJSON
    Emojis
      { emojis = emojis_
      } =
      A.object
        [ "@type" A..= T.String "emojis",
          "emojis" A..= emojis_
        ]
