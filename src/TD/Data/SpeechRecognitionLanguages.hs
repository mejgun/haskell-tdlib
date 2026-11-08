module TD.Data.SpeechRecognitionLanguages
  (SpeechRecognitionLanguages(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data SpeechRecognitionLanguages
  = SpeechRecognitionLanguages -- ^ Contains a list of probable languages of speech
    { language_codes :: Maybe [T.Text] -- ^ IETF language tags of the languages in descending order of their probability; for example, "en-US"
    }
  deriving (Eq, Show)

instance I.ShortShow SpeechRecognitionLanguages where
  shortShow SpeechRecognitionLanguages
    { language_codes = language_codes_
    }
      = "SpeechRecognitionLanguages"
        ++ I.cc
        [ "language_codes" `I.p` language_codes_
        ]

instance AT.FromJSON SpeechRecognitionLanguages where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "speechRecognitionLanguages" -> parseSpeechRecognitionLanguages v
      _                            -> mempty
    
    where
      parseSpeechRecognitionLanguages :: A.Value -> AT.Parser SpeechRecognitionLanguages
      parseSpeechRecognitionLanguages = A.withObject "SpeechRecognitionLanguages" $ \o -> do
        language_codes_ <- o A..:?  "language_codes"
        pure $ SpeechRecognitionLanguages
          { language_codes = language_codes_
          }
  parseJSON _ = mempty

