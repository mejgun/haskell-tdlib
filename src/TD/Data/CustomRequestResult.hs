module TD.Data.CustomRequestResult
  (CustomRequestResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data CustomRequestResult
  = CustomRequestResult -- ^ Contains the result of a custom request
    { result :: Maybe T.Text -- ^ A JSON-serialized result
    }
  deriving (Eq, Show)

instance I.ShortShow CustomRequestResult where
  shortShow CustomRequestResult
    { result = result_
    }
      = "CustomRequestResult"
        ++ I.cc
        [ "result" `I.p` result_
        ]

instance AT.FromJSON CustomRequestResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "customRequestResult" -> parseCustomRequestResult v
      _                     -> mempty
    
    where
      parseCustomRequestResult :: A.Value -> AT.Parser CustomRequestResult
      parseCustomRequestResult = A.withObject "CustomRequestResult" $ \o -> do
        result_ <- o A..:?  "result"
        pure $ CustomRequestResult
          { result = result_
          }
  parseJSON _ = mempty

