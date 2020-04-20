-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DisableProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DisableProxy = 
 DisableProxy -- deriving (Show)

instance T.ToJSON DisableProxy where
 toJSON (DisableProxy {  }) =
  A.object [ "@type" A..= T.String "disableProxy" ]
-- disableProxy DisableProxy 



instance T.FromJSON DisableProxy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "disableProxy" -> parseDisableProxy v
  where
   parseDisableProxy :: A.Value -> T.Parser DisableProxy
   parseDisableProxy = A.withObject "DisableProxy" $ \o -> do
    return $ DisableProxy {  }