-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestCallEmpty where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Does nothing; for testing only. This is an offline method. Can be called before authorization
data TestCallEmpty = 

 TestCallEmpty deriving (Eq)

instance Show TestCallEmpty where
 show TestCallEmpty {  } =
  "TestCallEmpty" ++ U.cc [ ]

instance T.ToJSON TestCallEmpty where
 toJSON TestCallEmpty {  } =
  A.object [ "@type" A..= T.String "testCallEmpty" ]

instance T.FromJSON TestCallEmpty where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testCallEmpty" -> parseTestCallEmpty v
   _ -> mempty
  where
   parseTestCallEmpty :: A.Value -> T.Parser TestCallEmpty
   parseTestCallEmpty = A.withObject "TestCallEmpty" $ \o -> do
    return $ TestCallEmpty {  }
 parseJSON _ = mempty
