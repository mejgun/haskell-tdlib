{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Backgrounds where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Background as Background
import qualified Utils as U

-- |
data Backgrounds = -- | Contains a list of backgrounds @backgrounds A list of backgrounds
  Backgrounds
  { -- |
    backgrounds :: Maybe [Background.Background]
  }
  deriving (Eq)

instance Show Backgrounds where
  show
    Backgrounds
      { backgrounds = backgrounds_
      } =
      "Backgrounds"
        ++ U.cc
          [ U.p "backgrounds" backgrounds_
          ]

instance T.FromJSON Backgrounds where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "backgrounds" -> parseBackgrounds v
      _ -> mempty
    where
      parseBackgrounds :: A.Value -> T.Parser Backgrounds
      parseBackgrounds = A.withObject "Backgrounds" $ \o -> do
        backgrounds_ <- o A..:? "backgrounds"
        return $ Backgrounds {backgrounds = backgrounds_}
  parseJSON _ = mempty

instance T.ToJSON Backgrounds where
  toJSON
    Backgrounds
      { backgrounds = backgrounds_
      } =
      A.object
        [ "@type" A..= T.String "backgrounds",
          "backgrounds" A..= backgrounds_
        ]
