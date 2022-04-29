-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAttachmentMenuBot where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns information about a bot that can be added to attachment menu 
-- 
-- __bot_user_id__ Bot's user identifier
data GetAttachmentMenuBot = 

 GetAttachmentMenuBot { bot_user_id :: Maybe Int }  deriving (Eq)

instance Show GetAttachmentMenuBot where
 show GetAttachmentMenuBot { bot_user_id=bot_user_id } =
  "GetAttachmentMenuBot" ++ cc [p "bot_user_id" bot_user_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetAttachmentMenuBot where
 toJSON GetAttachmentMenuBot { bot_user_id = bot_user_id } =
  A.object [ "@type" A..= T.String "getAttachmentMenuBot", "bot_user_id" A..= bot_user_id ]

instance T.FromJSON GetAttachmentMenuBot where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getAttachmentMenuBot" -> parseGetAttachmentMenuBot v
   _ -> mempty
  where
   parseGetAttachmentMenuBot :: A.Value -> T.Parser GetAttachmentMenuBot
   parseGetAttachmentMenuBot = A.withObject "GetAttachmentMenuBot" $ \o -> do
    bot_user_id <- mconcat [ o A..:? "bot_user_id", readMaybe <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetAttachmentMenuBot { bot_user_id = bot_user_id }
 parseJSON _ = mempty
