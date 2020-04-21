-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InlineQueryResults where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InlineQueryResult as InlineQueryResult

--main = putStrLn "ok"

data InlineQueryResults = 
 InlineQueryResults { switch_pm_parameter :: String, switch_pm_text :: String, results :: [InlineQueryResult.InlineQueryResult], next_offset :: String, inline_query_id :: Int }  deriving (Show)

instance T.ToJSON InlineQueryResults where
 toJSON (InlineQueryResults { switch_pm_parameter = switch_pm_parameter, switch_pm_text = switch_pm_text, results = results, next_offset = next_offset, inline_query_id = inline_query_id }) =
  A.object [ "@type" A..= T.String "inlineQueryResults", "switch_pm_parameter" A..= switch_pm_parameter, "switch_pm_text" A..= switch_pm_text, "results" A..= results, "next_offset" A..= next_offset, "inline_query_id" A..= inline_query_id ]



instance T.FromJSON InlineQueryResults where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inlineQueryResults" -> parseInlineQueryResults v

   _ -> mempty ""
  where
   parseInlineQueryResults :: A.Value -> T.Parser InlineQueryResults
   parseInlineQueryResults = A.withObject "InlineQueryResults" $ \o -> do
    switch_pm_parameter <- o A..: "switch_pm_parameter"
    switch_pm_text <- o A..: "switch_pm_text"
    results <- o A..: "results"
    next_offset <- o A..: "next_offset"
    inline_query_id <- o A..: "inline_query_id"
    return $ InlineQueryResults { switch_pm_parameter = switch_pm_parameter, switch_pm_text = switch_pm_text, results = results, next_offset = next_offset, inline_query_id = inline_query_id }