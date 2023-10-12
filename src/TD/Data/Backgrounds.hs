module TD.Data.Backgrounds where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.Background as Background

data Backgrounds
  = Backgrounds -- ^ Contains a list of backgrounds
    { backgrounds :: Maybe [Background.Background] -- ^ A list of backgrounds
    }
  deriving (Eq)

instance Show Backgrounds where
  show Backgrounds
    { backgrounds = backgrounds_
    }
      = "Backgrounds"
        ++ I.cc
        [ "backgrounds" `I.p` backgrounds_
        ]

instance AT.FromJSON Backgrounds where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "backgrounds" -> parseBackgrounds v
      _             -> mempty
    
    where
      parseBackgrounds :: A.Value -> AT.Parser Backgrounds
      parseBackgrounds = A.withObject "Backgrounds" $ \o -> do
        backgrounds_ <- o A..:?  "backgrounds"
        pure $ Backgrounds
          { backgrounds = backgrounds_
          }

instance AT.ToJSON Backgrounds where
  toJSON Backgrounds
    { backgrounds = backgrounds_
    }
      = A.object
        [ "@type"       A..= AT.String "backgrounds"
        , "backgrounds" A..= backgrounds_
        ]
