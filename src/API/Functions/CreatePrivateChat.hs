-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreatePrivateChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns an existing chat corresponding to a given user 
-- 
-- __user_id__ User identifier
-- 
-- __force__ If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
data CreatePrivateChat = 
 CreatePrivateChat { force :: Maybe Bool, user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON CreatePrivateChat where
 toJSON (CreatePrivateChat { force = force, user_id = user_id }) =
  A.object [ "@type" A..= T.String "createPrivateChat", "force" A..= force, "user_id" A..= user_id ]

instance T.FromJSON CreatePrivateChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createPrivateChat" -> parseCreatePrivateChat v
   _ -> mempty
  where
   parseCreatePrivateChat :: A.Value -> T.Parser CreatePrivateChat
   parseCreatePrivateChat = A.withObject "CreatePrivateChat" $ \o -> do
    force <- o A..:? "force"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CreatePrivateChat { force = force, user_id = user_id }