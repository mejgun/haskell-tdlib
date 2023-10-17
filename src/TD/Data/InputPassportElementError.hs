module TD.Data.InputPassportElementError
  ( InputPassportElementError(..)    
  , defaultInputPassportElementError 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PassportElementType as PassportElementType
import qualified Data.Text as T
import qualified TD.Data.InputPassportElementErrorSource as InputPassportElementErrorSource

data InputPassportElementError
  = InputPassportElementError -- ^ Contains the description of an error in a Telegram Passport element; for bots only
    { _type   :: Maybe PassportElementType.PassportElementType                         -- ^ Type of Telegram Passport element that has the error
    , message :: Maybe T.Text                                                          -- ^ Error message
    , source  :: Maybe InputPassportElementErrorSource.InputPassportElementErrorSource -- ^ Error source
    }
  deriving (Eq, Show)

instance I.ShortShow InputPassportElementError where
  shortShow InputPassportElementError
    { _type   = _type_
    , message = message_
    , source  = source_
    }
      = "InputPassportElementError"
        ++ I.cc
        [ "_type"   `I.p` _type_
        , "message" `I.p` message_
        , "source"  `I.p` source_
        ]

instance AT.FromJSON InputPassportElementError where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputPassportElementError" -> parseInputPassportElementError v
      _                           -> mempty
    
    where
      parseInputPassportElementError :: A.Value -> AT.Parser InputPassportElementError
      parseInputPassportElementError = A.withObject "InputPassportElementError" $ \o -> do
        _type_   <- o A..:?  "type"
        message_ <- o A..:?  "message"
        source_  <- o A..:?  "source"
        pure $ InputPassportElementError
          { _type   = _type_
          , message = message_
          , source  = source_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputPassportElementError where
  toJSON InputPassportElementError
    { _type   = _type_
    , message = message_
    , source  = source_
    }
      = A.object
        [ "@type"   A..= AT.String "inputPassportElementError"
        , "type"    A..= _type_
        , "message" A..= message_
        , "source"  A..= source_
        ]

defaultInputPassportElementError :: InputPassportElementError
defaultInputPassportElementError =
  InputPassportElementError
    { _type   = Nothing
    , message = Nothing
    , source  = Nothing
    }

