module TD.Query.SummarizeMessage
  (SummarizeMessage(..)
  , defaultSummarizeMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Summarizes content of the message with non-empty summary_language_code. Returns 'TD.Data.FormattedText.FormattedText'
data SummarizeMessage
  = SummarizeMessage
    { chat_id                    :: Maybe Int    -- ^ Identifier of the chat to which the message belongs
    , message_id                 :: Maybe Int    -- ^ Identifier of the message
    , translate_to_language_code :: Maybe T.Text -- ^ Pass a language code to which the summary will be translated; may be empty if translation isn't needed. See translateText.to_language_code for the list of supported values
    }
  deriving (Eq, Show)

instance I.ShortShow SummarizeMessage where
  shortShow
    SummarizeMessage
      { chat_id                    = chat_id_
      , message_id                 = message_id_
      , translate_to_language_code = translate_to_language_code_
      }
        = "SummarizeMessage"
          ++ I.cc
          [ "chat_id"                    `I.p` chat_id_
          , "message_id"                 `I.p` message_id_
          , "translate_to_language_code" `I.p` translate_to_language_code_
          ]

instance AT.ToJSON SummarizeMessage where
  toJSON
    SummarizeMessage
      { chat_id                    = chat_id_
      , message_id                 = message_id_
      , translate_to_language_code = translate_to_language_code_
      }
        = A.object
          [ "@type"                      A..= AT.String "summarizeMessage"
          , "chat_id"                    A..= chat_id_
          , "message_id"                 A..= message_id_
          , "translate_to_language_code" A..= translate_to_language_code_
          ]

defaultSummarizeMessage :: SummarizeMessage
defaultSummarizeMessage =
  SummarizeMessage
    { chat_id                    = Nothing
    , message_id                 = Nothing
    , translate_to_language_code = Nothing
    }

