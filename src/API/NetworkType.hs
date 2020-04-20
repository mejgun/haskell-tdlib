-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NetworkType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data NetworkType = 
 NetworkTypeNone 
 | NetworkTypeMobile 
 | NetworkTypeMobileRoaming 
 | NetworkTypeWiFi 
 | NetworkTypeOther -- deriving (Show)

instance T.ToJSON NetworkType where
 toJSON (NetworkTypeNone {  }) =
  A.object [ "@type" A..= T.String "networkTypeNone" ]

 toJSON (NetworkTypeMobile {  }) =
  A.object [ "@type" A..= T.String "networkTypeMobile" ]

 toJSON (NetworkTypeMobileRoaming {  }) =
  A.object [ "@type" A..= T.String "networkTypeMobileRoaming" ]

 toJSON (NetworkTypeWiFi {  }) =
  A.object [ "@type" A..= T.String "networkTypeWiFi" ]

 toJSON (NetworkTypeOther {  }) =
  A.object [ "@type" A..= T.String "networkTypeOther" ]
-- networkTypeNone NetworkType 

-- networkTypeMobile NetworkType 

-- networkTypeMobileRoaming NetworkType 

-- networkTypeWiFi NetworkType 

-- networkTypeOther NetworkType 

