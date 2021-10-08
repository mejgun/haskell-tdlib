-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.LeaveChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Removes the current user from chat members. Private and secret chats can't be left using this method 
-- 
-- __chat_id__ Chat identifier
data LeaveChat = 

 LeaveChat { chat_id :: Maybe Int }  deriving (Eq)

instance Show LeaveChat where
 show LeaveChat { chat_id=chat_id } =
  "LeaveChat" ++ cc [p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON LeaveChat where
 toJSON LeaveChat { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "leaveChat", "chat_id" A..= chat_id ]

instance T.FromJSON LeaveChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "leaveChat" -> parseLeaveChat v
   _ -> mempty
  where
   parseLeaveChat :: A.Value -> T.Parser LeaveChat
   parseLeaveChat = A.withObject "LeaveChat" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ LeaveChat { chat_id = chat_id }
 parseJSON _ = mempty
