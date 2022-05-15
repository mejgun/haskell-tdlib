{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InlineQueryResults where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InlineQueryResult as InlineQueryResult
import qualified Utils as U

-- |
data InlineQueryResults = -- | Represents the results of the inline query. Use sendInlineQueryResultMessage to send the result of the query @inline_query_id Unique identifier of the inline query @next_offset The offset for the next request. If empty, there are no more results @results Results of the query
  InlineQueryResults
  { -- |
    switch_pm_parameter :: Maybe String,
    -- | If non-empty, this text must be shown on the button, which opens a private chat with the bot and sends the bot a start message with the switch_pm_parameter @switch_pm_parameter Parameter for the bot start message
    switch_pm_text :: Maybe String,
    -- |
    results :: Maybe [InlineQueryResult.InlineQueryResult],
    -- |
    next_offset :: Maybe String,
    -- |
    inline_query_id :: Maybe Int
  }
  deriving (Eq)

instance Show InlineQueryResults where
  show
    InlineQueryResults
      { switch_pm_parameter = switch_pm_parameter_,
        switch_pm_text = switch_pm_text_,
        results = results_,
        next_offset = next_offset_,
        inline_query_id = inline_query_id_
      } =
      "InlineQueryResults"
        ++ U.cc
          [ U.p "switch_pm_parameter" switch_pm_parameter_,
            U.p "switch_pm_text" switch_pm_text_,
            U.p "results" results_,
            U.p "next_offset" next_offset_,
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
        switch_pm_parameter_ <- o A..:? "switch_pm_parameter"
        switch_pm_text_ <- o A..:? "switch_pm_text"
        results_ <- o A..:? "results"
        next_offset_ <- o A..:? "next_offset"
        inline_query_id_ <- U.rm <$> (o A..: "inline_query_id" :: T.Parser String) :: T.Parser (Maybe Int)
        return $ InlineQueryResults {switch_pm_parameter = switch_pm_parameter_, switch_pm_text = switch_pm_text_, results = results_, next_offset = next_offset_, inline_query_id = inline_query_id_}
  parseJSON _ = mempty

instance T.ToJSON InlineQueryResults where
  toJSON
    InlineQueryResults
      { switch_pm_parameter = switch_pm_parameter_,
        switch_pm_text = switch_pm_text_,
        results = results_,
        next_offset = next_offset_,
        inline_query_id = inline_query_id_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResults",
          "switch_pm_parameter" A..= switch_pm_parameter_,
          "switch_pm_text" A..= switch_pm_text_,
          "results" A..= results_,
          "next_offset" A..= next_offset_,
          "inline_query_id" A..= inline_query_id_
        ]
