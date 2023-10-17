module TD.Data.Text
  (Text(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data Text
  = Text -- ^ Contains some text
    { text :: Maybe T.Text -- ^ Text
    }
  deriving (Eq, Show)

instance I.ShortShow Text where
  shortShow Text
    { text = text_
    }
      = "Text"
        ++ I.cc
        [ "text" `I.p` text_
        ]

instance AT.FromJSON Text where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "text" -> parseText v
      _      -> mempty
    
    where
      parseText :: A.Value -> AT.Parser Text
      parseText = A.withObject "Text" $ \o -> do
        text_ <- o A..:?  "text"
        pure $ Text
          { text = text_
          }
  parseJSON _ = mempty

