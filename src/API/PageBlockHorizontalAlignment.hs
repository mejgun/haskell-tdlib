-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlockHorizontalAlignment where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data PageBlockHorizontalAlignment = 
 PageBlockHorizontalAlignmentLeft 
 | PageBlockHorizontalAlignmentCenter 
 | PageBlockHorizontalAlignmentRight -- deriving (Show)

instance T.ToJSON PageBlockHorizontalAlignment where
 toJSON (PageBlockHorizontalAlignmentLeft {  }) =
  A.object [ "@type" A..= T.String "pageBlockHorizontalAlignmentLeft" ]

 toJSON (PageBlockHorizontalAlignmentCenter {  }) =
  A.object [ "@type" A..= T.String "pageBlockHorizontalAlignmentCenter" ]

 toJSON (PageBlockHorizontalAlignmentRight {  }) =
  A.object [ "@type" A..= T.String "pageBlockHorizontalAlignmentRight" ]
-- pageBlockHorizontalAlignmentLeft PageBlockHorizontalAlignment 

-- pageBlockHorizontalAlignmentCenter PageBlockHorizontalAlignment 

-- pageBlockHorizontalAlignmentRight PageBlockHorizontalAlignment 

