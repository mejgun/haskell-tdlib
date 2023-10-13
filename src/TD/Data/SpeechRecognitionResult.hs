module TD.Data.SpeechRecognitionResult
  ( SpeechRecognitionResult(..)           
  , defaultSpeechRecognitionResultPending 
  , defaultSpeechRecognitionResultText    
  , defaultSpeechRecognitionResultError   
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Error as Error

data SpeechRecognitionResult -- ^ Describes result of speech recognition in a voice note
  = SpeechRecognitionResultPending -- ^ The speech recognition is ongoing
    { partial_text :: Maybe T.Text -- ^ Partially recognized text
    }
  | SpeechRecognitionResultText -- ^ The speech recognition successfully finished
    { text :: Maybe T.Text -- ^ Recognized text
    }
  | SpeechRecognitionResultError -- ^ The speech recognition failed
    { _error :: Maybe Error.Error -- ^ Recognition error
    }
  deriving (Eq)

instance Show SpeechRecognitionResult where
  show SpeechRecognitionResultPending
    { partial_text = partial_text_
    }
      = "SpeechRecognitionResultPending"
        ++ I.cc
        [ "partial_text" `I.p` partial_text_
        ]
  show SpeechRecognitionResultText
    { text = text_
    }
      = "SpeechRecognitionResultText"
        ++ I.cc
        [ "text" `I.p` text_
        ]
  show SpeechRecognitionResultError
    { _error = _error_
    }
      = "SpeechRecognitionResultError"
        ++ I.cc
        [ "_error" `I.p` _error_
        ]

instance AT.FromJSON SpeechRecognitionResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "speechRecognitionResultPending" -> parseSpeechRecognitionResultPending v
      "speechRecognitionResultText"    -> parseSpeechRecognitionResultText v
      "speechRecognitionResultError"   -> parseSpeechRecognitionResultError v
      _                                -> mempty
    
    where
      parseSpeechRecognitionResultPending :: A.Value -> AT.Parser SpeechRecognitionResult
      parseSpeechRecognitionResultPending = A.withObject "SpeechRecognitionResultPending" $ \o -> do
        partial_text_ <- o A..:?  "partial_text"
        pure $ SpeechRecognitionResultPending
          { partial_text = partial_text_
          }
      parseSpeechRecognitionResultText :: A.Value -> AT.Parser SpeechRecognitionResult
      parseSpeechRecognitionResultText = A.withObject "SpeechRecognitionResultText" $ \o -> do
        text_ <- o A..:?  "text"
        pure $ SpeechRecognitionResultText
          { text = text_
          }
      parseSpeechRecognitionResultError :: A.Value -> AT.Parser SpeechRecognitionResult
      parseSpeechRecognitionResultError = A.withObject "SpeechRecognitionResultError" $ \o -> do
        _error_ <- o A..:?  "error"
        pure $ SpeechRecognitionResultError
          { _error = _error_
          }
  parseJSON _ = mempty

instance AT.ToJSON SpeechRecognitionResult where
  toJSON SpeechRecognitionResultPending
    { partial_text = partial_text_
    }
      = A.object
        [ "@type"        A..= AT.String "speechRecognitionResultPending"
        , "partial_text" A..= partial_text_
        ]
  toJSON SpeechRecognitionResultText
    { text = text_
    }
      = A.object
        [ "@type" A..= AT.String "speechRecognitionResultText"
        , "text"  A..= text_
        ]
  toJSON SpeechRecognitionResultError
    { _error = _error_
    }
      = A.object
        [ "@type" A..= AT.String "speechRecognitionResultError"
        , "error" A..= _error_
        ]

defaultSpeechRecognitionResultPending :: SpeechRecognitionResult
defaultSpeechRecognitionResultPending =
  SpeechRecognitionResultPending
    { partial_text = Nothing
    }

defaultSpeechRecognitionResultText :: SpeechRecognitionResult
defaultSpeechRecognitionResultText =
  SpeechRecognitionResultText
    { text = Nothing
    }

defaultSpeechRecognitionResultError :: SpeechRecognitionResult
defaultSpeechRecognitionResultError =
  SpeechRecognitionResultError
    { _error = Nothing
    }

