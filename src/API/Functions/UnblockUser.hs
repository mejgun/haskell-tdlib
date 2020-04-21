-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UnblockUser where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data UnblockUser = 
 UnblockUser { user_id :: Int }  deriving (Show)

instance T.ToJSON UnblockUser where
 toJSON (UnblockUser { user_id = user_id }) =
  A.object [ "@type" A..= T.String "unblockUser", "user_id" A..= user_id ]



instance T.FromJSON UnblockUser where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "unblockUser" -> parseUnblockUser v

   _ -> mempty ""
  where
   parseUnblockUser :: A.Value -> T.Parser UnblockUser
   parseUnblockUser = A.withObject "UnblockUser" $ \o -> do
    user_id <- o A..: "user_id"
    return $ UnblockUser { user_id = user_id }