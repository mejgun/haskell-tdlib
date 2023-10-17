module TD.Data.PassportElementError
  (PassportElementError(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PassportElementType as PassportElementType
import qualified Data.Text as T
import qualified TD.Data.PassportElementErrorSource as PassportElementErrorSource

data PassportElementError
  = PassportElementError -- ^ Contains the description of an error in a Telegram Passport element
    { _type   :: Maybe PassportElementType.PassportElementType               -- ^ Type of the Telegram Passport element which has the error
    , message :: Maybe T.Text                                                -- ^ Error message
    , source  :: Maybe PassportElementErrorSource.PassportElementErrorSource -- ^ Error source
    }
  deriving (Eq, Show)

instance I.ShortShow PassportElementError where
  shortShow PassportElementError
    { _type   = _type_
    , message = message_
    , source  = source_
    }
      = "PassportElementError"
        ++ I.cc
        [ "_type"   `I.p` _type_
        , "message" `I.p` message_
        , "source"  `I.p` source_
        ]

instance AT.FromJSON PassportElementError where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "passportElementError" -> parsePassportElementError v
      _                      -> mempty
    
    where
      parsePassportElementError :: A.Value -> AT.Parser PassportElementError
      parsePassportElementError = A.withObject "PassportElementError" $ \o -> do
        _type_   <- o A..:?  "type"
        message_ <- o A..:?  "message"
        source_  <- o A..:?  "source"
        pure $ PassportElementError
          { _type   = _type_
          , message = message_
          , source  = source_
          }
  parseJSON _ = mempty

