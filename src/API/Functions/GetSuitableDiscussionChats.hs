-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSuitableDiscussionChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetSuitableDiscussionChats = 
 GetSuitableDiscussionChats -- deriving (Show)

instance T.ToJSON GetSuitableDiscussionChats where
 toJSON (GetSuitableDiscussionChats {  }) =
  A.object [ "@type" A..= T.String "getSuitableDiscussionChats" ]
-- getSuitableDiscussionChats GetSuitableDiscussionChats 



instance T.FromJSON GetSuitableDiscussionChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSuitableDiscussionChats" -> parseGetSuitableDiscussionChats v
  where
   parseGetSuitableDiscussionChats :: A.Value -> T.Parser GetSuitableDiscussionChats
   parseGetSuitableDiscussionChats = A.withObject "GetSuitableDiscussionChats" $ \o -> do
    return $ GetSuitableDiscussionChats {  }