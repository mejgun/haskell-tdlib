module TD.Query.AnswerCallbackQuery(AnswerCallbackQuery(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data AnswerCallbackQuery -- ^ Sets the result of a callback query; for bots only
  = AnswerCallbackQuery
    { callback_query_id :: Maybe Int    -- ^ Identifier of the callback query
    , text              :: Maybe T.Text -- ^ Text of the answer
    , show_alert        :: Maybe Bool   -- ^ Pass true to show an alert to the user instead of a toast notification
    , url               :: Maybe T.Text -- ^ URL to be opened
    , cache_time        :: Maybe Int    -- ^ Time during which the result of the query can be cached, in seconds
    }
  deriving (Eq)

instance Show AnswerCallbackQuery where
  show
    AnswerCallbackQuery
      { callback_query_id = callback_query_id_
      , text              = text_
      , show_alert        = show_alert_
      , url               = url_
      , cache_time        = cache_time_
      }
        = "AnswerCallbackQuery"
          ++ I.cc
          [ "callback_query_id" `I.p` callback_query_id_
          , "text"              `I.p` text_
          , "show_alert"        `I.p` show_alert_
          , "url"               `I.p` url_
          , "cache_time"        `I.p` cache_time_
          ]

instance AT.ToJSON AnswerCallbackQuery where
  toJSON
    AnswerCallbackQuery
      { callback_query_id = callback_query_id_
      , text              = text_
      , show_alert        = show_alert_
      , url               = url_
      , cache_time        = cache_time_
      }
        = A.object
          [ "@type"             A..= AT.String "answerCallbackQuery"
          , "callback_query_id" A..= fmap I.writeInt64  callback_query_id_
          , "text"              A..= text_
          , "show_alert"        A..= show_alert_
          , "url"               A..= url_
          , "cache_time"        A..= cache_time_
          ]
