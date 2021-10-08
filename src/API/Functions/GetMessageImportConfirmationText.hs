-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageImportConfirmationText where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns a confirmation text to be shown to the user before starting message import
-- 
-- __chat_id__ Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info administrator right
data GetMessageImportConfirmationText = 

 GetMessageImportConfirmationText { chat_id :: Maybe Int }  deriving (Eq)

instance Show GetMessageImportConfirmationText where
 show GetMessageImportConfirmationText { chat_id=chat_id } =
  "GetMessageImportConfirmationText" ++ cc [p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetMessageImportConfirmationText where
 toJSON GetMessageImportConfirmationText { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getMessageImportConfirmationText", "chat_id" A..= chat_id ]

instance T.FromJSON GetMessageImportConfirmationText where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessageImportConfirmationText" -> parseGetMessageImportConfirmationText v
   _ -> mempty
  where
   parseGetMessageImportConfirmationText :: A.Value -> T.Parser GetMessageImportConfirmationText
   parseGetMessageImportConfirmationText = A.withObject "GetMessageImportConfirmationText" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetMessageImportConfirmationText { chat_id = chat_id }
 parseJSON _ = mempty
