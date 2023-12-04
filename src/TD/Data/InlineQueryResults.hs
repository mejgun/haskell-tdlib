module TD.Data.InlineQueryResults
  (InlineQueryResults(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InlineQueryResultsButton as InlineQueryResultsButton
import qualified TD.Data.InlineQueryResult as InlineQueryResult
import qualified Data.Text as T

data InlineQueryResults
  = InlineQueryResults -- ^ Represents the results of the inline query. Use sendInlineQueryResultMessage to send the result of the query
    { inline_query_id :: Maybe Int                                               -- ^ Unique identifier of the inline query
    , button          :: Maybe InlineQueryResultsButton.InlineQueryResultsButton -- ^ Button to be shown above inline query results; may be null
    , results         :: Maybe [InlineQueryResult.InlineQueryResult]             -- ^ Results of the query
    , next_offset     :: Maybe T.Text                                            -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow InlineQueryResults where
  shortShow InlineQueryResults
    { inline_query_id = inline_query_id_
    , button          = button_
    , results         = results_
    , next_offset     = next_offset_
    }
      = "InlineQueryResults"
        ++ I.cc
        [ "inline_query_id" `I.p` inline_query_id_
        , "button"          `I.p` button_
        , "results"         `I.p` results_
        , "next_offset"     `I.p` next_offset_
        ]

instance AT.FromJSON InlineQueryResults where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inlineQueryResults" -> parseInlineQueryResults v
      _                    -> mempty
    
    where
      parseInlineQueryResults :: A.Value -> AT.Parser InlineQueryResults
      parseInlineQueryResults = A.withObject "InlineQueryResults" $ \o -> do
        inline_query_id_ <- fmap I.readInt64 <$> o A..:?  "inline_query_id"
        button_          <- o A..:?                       "button"
        results_         <- o A..:?                       "results"
        next_offset_     <- o A..:?                       "next_offset"
        pure $ InlineQueryResults
          { inline_query_id = inline_query_id_
          , button          = button_
          , results         = results_
          , next_offset     = next_offset_
          }
  parseJSON _ = mempty

