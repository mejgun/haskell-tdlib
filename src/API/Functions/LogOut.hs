-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.LogOut where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data LogOut = 
 LogOut deriving (Show)

instance T.ToJSON LogOut where
 toJSON (LogOut {  }) =
  A.object [ "@type" A..= T.String "logOut" ]



instance T.FromJSON LogOut where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "logOut" -> parseLogOut v

   _ -> mempty ""
  where
   parseLogOut :: A.Value -> T.Parser LogOut
   parseLogOut = A.withObject "LogOut" $ \o -> do
    return $ LogOut {  }