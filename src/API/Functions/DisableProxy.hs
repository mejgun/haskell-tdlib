-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DisableProxy where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Disables the currently enabled proxy. Can be called before authorization
data DisableProxy = 

 DisableProxy deriving (Eq)

instance Show DisableProxy where
 show DisableProxy {  } =
  "DisableProxy" ++ U.cc [ ]

instance T.ToJSON DisableProxy where
 toJSON DisableProxy {  } =
  A.object [ "@type" A..= T.String "disableProxy" ]

instance T.FromJSON DisableProxy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "disableProxy" -> parseDisableProxy v
   _ -> mempty
  where
   parseDisableProxy :: A.Value -> T.Parser DisableProxy
   parseDisableProxy = A.withObject "DisableProxy" $ \o -> do
    return $ DisableProxy {  }
 parseJSON _ = mempty
