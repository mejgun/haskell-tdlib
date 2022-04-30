-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateNewSecretChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Creates a new secret chat. Returns the newly created chat 
-- 
-- __user_id__ Identifier of the target user
data CreateNewSecretChat = 

 CreateNewSecretChat { user_id :: Maybe Int }  deriving (Eq)

instance Show CreateNewSecretChat where
 show CreateNewSecretChat { user_id=user_id } =
  "CreateNewSecretChat" ++ U.cc [U.p "user_id" user_id ]

instance T.ToJSON CreateNewSecretChat where
 toJSON CreateNewSecretChat { user_id = user_id } =
  A.object [ "@type" A..= T.String "createNewSecretChat", "user_id" A..= user_id ]

instance T.FromJSON CreateNewSecretChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createNewSecretChat" -> parseCreateNewSecretChat v
   _ -> mempty
  where
   parseCreateNewSecretChat :: A.Value -> T.Parser CreateNewSecretChat
   parseCreateNewSecretChat = A.withObject "CreateNewSecretChat" $ \o -> do
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CreateNewSecretChat { user_id = user_id }
 parseJSON _ = mempty
