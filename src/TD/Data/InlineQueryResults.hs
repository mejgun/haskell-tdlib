{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InlineQueryResults where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InlineQueryResult as InlineQueryResult
import qualified TD.Data.InlineQueryResultsButton as InlineQueryResultsButton
import qualified Utils as U

-- |
data InlineQueryResults = -- | Represents the results of the inline query. Use sendInlineQueryResultMessage to send the result of the query
  InlineQueryResults
  { -- | The offset for the next request. If empty, there are no more results
    next_offset :: Maybe String,
    -- | Results of the query
    results :: Maybe [InlineQueryResult.InlineQueryResult],
    -- | Button to be shown above inline query results; may be null
    button :: Maybe InlineQueryResultsButton.InlineQueryResultsButton,
    -- | Unique identifier of the inline query
    inline_query_id :: Maybe Int
  }
  deriving (Eq)

instance Show InlineQueryResults where
  show
    InlineQueryResults
      { next_offset = next_offset_,
        results = results_,
        button = button_,
        inline_query_id = inline_query_id_
      } =
      "InlineQueryResults"
        ++ U.cc
          [ U.p "next_offset" next_offset_,
            U.p "results" results_,
            U.p "button" button_,
            U.p "inline_query_id" inline_query_id_
          ]

instance T.FromJSON InlineQueryResults where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inlineQueryResults" -> parseInlineQueryResults v
      _ -> mempty
    where
      parseInlineQueryResults :: A.Value -> T.Parser InlineQueryResults
      parseInlineQueryResults = A.withObject "InlineQueryResults" $ \o -> do
        next_offset_ <- o A..:? "next_offset"
        results_ <- o A..:? "results"
        button_ <- o A..:? "button"
        inline_query_id_ <- U.rm <$> (o A..:? "inline_query_id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ InlineQueryResults {next_offset = next_offset_, results = results_, button = button_, inline_query_id = inline_query_id_}
  parseJSON _ = mempty

instance T.ToJSON InlineQueryResults where
  toJSON
    InlineQueryResults
      { next_offset = next_offset_,
        results = results_,
        button = button_,
        inline_query_id = inline_query_id_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResults",
          "next_offset" A..= next_offset_,
          "results" A..= results_,
          "button" A..= button_,
          "inline_query_id" A..= U.toS inline_query_id_
        ]
