{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.SpeechRecognitionResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Error as Error
import qualified Utils as U

-- | Describes result of speech recognition in a voice note
data SpeechRecognitionResult
  = -- | The speech recognition is ongoing @partial_text Partially recognized text
    SpeechRecognitionResultPending
      { -- |
        partial_text :: Maybe String
      }
  | -- | The speech recognition successfully finished @text Recognized text
    SpeechRecognitionResultText
      { -- |
        text :: Maybe String
      }
  | -- | The speech recognition failed @error Recognition error
    SpeechRecognitionResultError
      { -- |
        _error :: Maybe Error.Error
      }
  deriving (Eq)

instance Show SpeechRecognitionResult where
  show
    SpeechRecognitionResultPending
      { partial_text = partial_text_
      } =
      "SpeechRecognitionResultPending"
        ++ U.cc
          [ U.p "partial_text" partial_text_
          ]
  show
    SpeechRecognitionResultText
      { text = text_
      } =
      "SpeechRecognitionResultText"
        ++ U.cc
          [ U.p "text" text_
          ]
  show
    SpeechRecognitionResultError
      { _error = _error_
      } =
      "SpeechRecognitionResultError"
        ++ U.cc
          [ U.p "_error" _error_
          ]

instance T.FromJSON SpeechRecognitionResult where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "speechRecognitionResultPending" -> parseSpeechRecognitionResultPending v
      "speechRecognitionResultText" -> parseSpeechRecognitionResultText v
      "speechRecognitionResultError" -> parseSpeechRecognitionResultError v
      _ -> mempty
    where
      parseSpeechRecognitionResultPending :: A.Value -> T.Parser SpeechRecognitionResult
      parseSpeechRecognitionResultPending = A.withObject "SpeechRecognitionResultPending" $ \o -> do
        partial_text_ <- o A..:? "partial_text"
        return $ SpeechRecognitionResultPending {partial_text = partial_text_}

      parseSpeechRecognitionResultText :: A.Value -> T.Parser SpeechRecognitionResult
      parseSpeechRecognitionResultText = A.withObject "SpeechRecognitionResultText" $ \o -> do
        text_ <- o A..:? "text"
        return $ SpeechRecognitionResultText {text = text_}

      parseSpeechRecognitionResultError :: A.Value -> T.Parser SpeechRecognitionResult
      parseSpeechRecognitionResultError = A.withObject "SpeechRecognitionResultError" $ \o -> do
        _error_ <- o A..:? "error"
        return $ SpeechRecognitionResultError {_error = _error_}
  parseJSON _ = mempty

instance T.ToJSON SpeechRecognitionResult where
  toJSON
    SpeechRecognitionResultPending
      { partial_text = partial_text_
      } =
      A.object
        [ "@type" A..= T.String "speechRecognitionResultPending",
          "partial_text" A..= partial_text_
        ]
  toJSON
    SpeechRecognitionResultText
      { text = text_
      } =
      A.object
        [ "@type" A..= T.String "speechRecognitionResultText",
          "text" A..= text_
        ]
  toJSON
    SpeechRecognitionResultError
      { _error = _error_
      } =
      A.object
        [ "@type" A..= T.String "speechRecognitionResultError",
          "error" A..= _error_
        ]
