-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns information about a chat by its identifier, this is an offline request if the current user is not a bot 
-- 
-- __chat_id__ Chat identifier
data GetChat = 

 GetChat { chat_id :: Maybe Int }  deriving (Eq)

instance Show GetChat where
 show GetChat { chat_id=chat_id } =
  "GetChat" ++ cc [p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetChat where
 toJSON GetChat { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getChat", "chat_id" A..= chat_id ]

instance T.FromJSON GetChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChat" -> parseGetChat v
   _ -> mempty
  where
   parseGetChat :: A.Value -> T.Parser GetChat
   parseGetChat = A.withObject "GetChat" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChat { chat_id = chat_id }
 parseJSON _ = mempty
