-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AnswerWebAppQuery where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.InputInlineQueryResult as InputInlineQueryResult

-- |
-- 
-- Sets the result of interaction with a web app and sends corresponding message on behalf of the user to the chat from which the query originated; for bots only
-- 
-- __web_app_query_id__ Identifier of the web app query
-- 
-- __result__ The result of the query
data AnswerWebAppQuery = 

 AnswerWebAppQuery { result :: Maybe InputInlineQueryResult.InputInlineQueryResult, web_app_query_id :: Maybe String }  deriving (Eq)

instance Show AnswerWebAppQuery where
 show AnswerWebAppQuery { result=result, web_app_query_id=web_app_query_id } =
  "AnswerWebAppQuery" ++ U.cc [U.p "result" result, U.p "web_app_query_id" web_app_query_id ]

instance T.ToJSON AnswerWebAppQuery where
 toJSON AnswerWebAppQuery { result = result, web_app_query_id = web_app_query_id } =
  A.object [ "@type" A..= T.String "answerWebAppQuery", "result" A..= result, "web_app_query_id" A..= web_app_query_id ]

instance T.FromJSON AnswerWebAppQuery where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "answerWebAppQuery" -> parseAnswerWebAppQuery v
   _ -> mempty
  where
   parseAnswerWebAppQuery :: A.Value -> T.Parser AnswerWebAppQuery
   parseAnswerWebAppQuery = A.withObject "AnswerWebAppQuery" $ \o -> do
    result <- o A..:? "result"
    web_app_query_id <- o A..:? "web_app_query_id"
    return $ AnswerWebAppQuery { result = result, web_app_query_id = web_app_query_id }
 parseJSON _ = mempty
