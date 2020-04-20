-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInactiveSupergroupChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetInactiveSupergroupChats = 
 GetInactiveSupergroupChats -- deriving (Show)

instance T.ToJSON GetInactiveSupergroupChats where
 toJSON (GetInactiveSupergroupChats {  }) =
  A.object [ "@type" A..= T.String "getInactiveSupergroupChats" ]
-- getInactiveSupergroupChats GetInactiveSupergroupChats 



instance T.FromJSON GetInactiveSupergroupChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getInactiveSupergroupChats" -> parseGetInactiveSupergroupChats v
  where
   parseGetInactiveSupergroupChats :: A.Value -> T.Parser GetInactiveSupergroupChats
   parseGetInactiveSupergroupChats = A.withObject "GetInactiveSupergroupChats" $ \o -> do
    return $ GetInactiveSupergroupChats {  }