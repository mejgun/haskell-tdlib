-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageStatistics where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.StatisticalGraph as StatisticalGraph

-- |
-- 
-- A detailed statistics about a message 
-- 
-- __message_interaction_graph__ A graph containing number of message views and shares
data MessageStatistics = 

 MessageStatistics { message_interaction_graph :: Maybe StatisticalGraph.StatisticalGraph }  deriving (Eq)

instance Show MessageStatistics where
 show MessageStatistics { message_interaction_graph=message_interaction_graph } =
  "MessageStatistics" ++ cc [p "message_interaction_graph" message_interaction_graph ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON MessageStatistics where
 toJSON MessageStatistics { message_interaction_graph = message_interaction_graph } =
  A.object [ "@type" A..= T.String "messageStatistics", "message_interaction_graph" A..= message_interaction_graph ]

instance T.FromJSON MessageStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageStatistics" -> parseMessageStatistics v
   _ -> mempty
  where
   parseMessageStatistics :: A.Value -> T.Parser MessageStatistics
   parseMessageStatistics = A.withObject "MessageStatistics" $ \o -> do
    message_interaction_graph <- o A..:? "message_interaction_graph"
    return $ MessageStatistics { message_interaction_graph = message_interaction_graph }
 parseJSON _ = mempty
