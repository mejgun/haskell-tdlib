-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetStatisticalGraph where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Loads an asynchronous or a zoomed in statistical graph 
-- 
-- __chat_id__ Chat identifier
-- 
-- __token__ The token for graph loading
-- 
-- __x__ X-value for zoomed in graph or 0 otherwise
data GetStatisticalGraph = 

 GetStatisticalGraph { x :: Maybe Int, token :: Maybe String, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetStatisticalGraph where
 show GetStatisticalGraph { x=x, token=token, chat_id=chat_id } =
  "GetStatisticalGraph" ++ cc [p "x" x, p "token" token, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetStatisticalGraph where
 toJSON GetStatisticalGraph { x = x, token = token, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getStatisticalGraph", "x" A..= x, "token" A..= token, "chat_id" A..= chat_id ]

instance T.FromJSON GetStatisticalGraph where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getStatisticalGraph" -> parseGetStatisticalGraph v
   _ -> mempty
  where
   parseGetStatisticalGraph :: A.Value -> T.Parser GetStatisticalGraph
   parseGetStatisticalGraph = A.withObject "GetStatisticalGraph" $ \o -> do
    x <- mconcat [ o A..:? "x", readMaybe <$> (o A..: "x" :: T.Parser String)] :: T.Parser (Maybe Int)
    token <- o A..:? "token"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetStatisticalGraph { x = x, token = token, chat_id = chat_id }
 parseJSON _ = mempty
