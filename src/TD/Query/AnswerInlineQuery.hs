module TD.Query.AnswerInlineQuery
  (AnswerInlineQuery(..)
  , defaultAnswerInlineQuery
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InlineQueryResultsButton as InlineQueryResultsButton
import qualified TD.Data.InputInlineQueryResult as InputInlineQueryResult
import qualified Data.Text as T

-- | Sets the result of an inline query; for bots only. Returns 'TD.Data.Ok.Ok'
data AnswerInlineQuery
  = AnswerInlineQuery
    { inline_query_id :: Maybe Int                                               -- ^ Identifier of the inline query
    , is_personal     :: Maybe Bool                                              -- ^ Pass true if results may be cached and returned only for the user that sent the query. By default, results may be returned to any user who sends the same query
    , button          :: Maybe InlineQueryResultsButton.InlineQueryResultsButton -- ^ Button to be shown above inline query results; pass null if none
    , results         :: Maybe [InputInlineQueryResult.InputInlineQueryResult]   -- ^ The results of the query
    , cache_time      :: Maybe Int                                               -- ^ Allowed time to cache the results of the query, in seconds
    , next_offset     :: Maybe T.Text                                            -- ^ Offset for the next inline query; pass an empty string if there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow AnswerInlineQuery where
  shortShow
    AnswerInlineQuery
      { inline_query_id = inline_query_id_
      , is_personal     = is_personal_
      , button          = button_
      , results         = results_
      , cache_time      = cache_time_
      , next_offset     = next_offset_
      }
        = "AnswerInlineQuery"
          ++ I.cc
          [ "inline_query_id" `I.p` inline_query_id_
          , "is_personal"     `I.p` is_personal_
          , "button"          `I.p` button_
          , "results"         `I.p` results_
          , "cache_time"      `I.p` cache_time_
          , "next_offset"     `I.p` next_offset_
          ]

instance AT.ToJSON AnswerInlineQuery where
  toJSON
    AnswerInlineQuery
      { inline_query_id = inline_query_id_
      , is_personal     = is_personal_
      , button          = button_
      , results         = results_
      , cache_time      = cache_time_
      , next_offset     = next_offset_
      }
        = A.object
          [ "@type"           A..= AT.String "answerInlineQuery"
          , "inline_query_id" A..= fmap I.writeInt64  inline_query_id_
          , "is_personal"     A..= is_personal_
          , "button"          A..= button_
          , "results"         A..= results_
          , "cache_time"      A..= cache_time_
          , "next_offset"     A..= next_offset_
          ]

defaultAnswerInlineQuery :: AnswerInlineQuery
defaultAnswerInlineQuery =
  AnswerInlineQuery
    { inline_query_id = Nothing
    , is_personal     = Nothing
    , button          = Nothing
    , results         = Nothing
    , cache_time      = Nothing
    , next_offset     = Nothing
    }

