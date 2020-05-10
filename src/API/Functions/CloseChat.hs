-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CloseChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Informs TDLib that the chat is closed by the user. Many useful activities depend on the chat being opened or closed 
-- 
-- __chat_id__ Chat identifier
data CloseChat = 

 CloseChat { chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON CloseChat where
 toJSON (CloseChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "closeChat", "chat_id" A..= chat_id ]

instance T.FromJSON CloseChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "closeChat" -> parseCloseChat v
   _ -> mempty
  where
   parseCloseChat :: A.Value -> T.Parser CloseChat
   parseCloseChat = A.withObject "CloseChat" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CloseChat { chat_id = chat_id }