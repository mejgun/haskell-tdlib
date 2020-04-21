-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateNewBasicGroupChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CreateNewBasicGroupChat = 
 CreateNewBasicGroupChat { title :: String, user_ids :: [Int] }  deriving (Show)

instance T.ToJSON CreateNewBasicGroupChat where
 toJSON (CreateNewBasicGroupChat { title = title, user_ids = user_ids }) =
  A.object [ "@type" A..= T.String "createNewBasicGroupChat", "title" A..= title, "user_ids" A..= user_ids ]

instance T.FromJSON CreateNewBasicGroupChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createNewBasicGroupChat" -> parseCreateNewBasicGroupChat v
   _ -> mempty
  where
   parseCreateNewBasicGroupChat :: A.Value -> T.Parser CreateNewBasicGroupChat
   parseCreateNewBasicGroupChat = A.withObject "CreateNewBasicGroupChat" $ \o -> do
    title <- o A..: "title"
    user_ids <- o A..: "user_ids"
    return $ CreateNewBasicGroupChat { title = title, user_ids = user_ids }